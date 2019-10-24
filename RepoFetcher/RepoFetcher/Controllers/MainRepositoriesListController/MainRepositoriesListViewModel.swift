//
//  MainRepositoriesListViewModel.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 22/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import RxSwift

protocol MainRepositoriesListViewModelDelegate: class {
    func update(with values: [RepositoryRenderable])
}

protocol MainRepositoriesListViewModelProtocol: class {
    func fetchRepositoriesData()
    func item(at index: Int) -> RepositoryRenderable
    
    var delegate: MainRepositoriesListViewModelDelegate! { get set }
    var newValues: [RepositoryRenderable] { get }
    var numberOfItemsInDataSource: Int { get }
    var dataSource: [RepositoryRenderable] { get }
}

final class MainRepositoriesListViewModel: MainRepositoriesListViewModelProtocol {
    private let coordinator: MainRepositoryListCoordinatorProtocol!
    private let worker: MainRepositoriesListWorkerProtocol
    private var disposeBag = DisposeBag()
    
    private var repositoriesRenderables: [RepositoryRenderable] = [] {
        didSet {
            delegate.update(with: newValues)
        }
    }
    
    var newValues: [RepositoryRenderable] = [] {
        didSet {
            repositoriesRenderables.append(contentsOf: newValues)
        }
    }
    
    weak var delegate: MainRepositoriesListViewModelDelegate!
    
    var numberOfItemsInDataSource: Int {
        return repositoriesRenderables.count
    }
    
    var dataSource: [RepositoryRenderable] {
        return repositoriesRenderables
    }
    
    init(coordinator: MainRepositoryListCoordinatorProtocol, worker: MainRepositoriesListWorkerProtocol = MainRepositoriesListWorker()) {
        self.coordinator = coordinator
        self.worker = worker
            
        setup()
    }
    
    func fetchRepositoriesData() {
        worker.fetchRepositoriesList(from: "2019-08-01", page: "1")
            .subscribe(onSuccess: { [weak self] response in
                self?.handleSuccessResponse(with: response)
            }) { [weak self] error in
                self?.handleErrorResponse(error: error)
        }
        .disposed(by: disposeBag)
    }
    
    func item(at index: Int) -> RepositoryRenderable {
        return repositoriesRenderables[index]
    }
    
    private func setup() {
        fetchRepositoriesData()
    }
    
    private func cancelRequest() {
        disposeBag = DisposeBag()
    }
    
    private func handleSuccessResponse(with response: RepositoriesListResponse) {
        newValues = response.items?.compactMap { RepositoryRenderable(item: $0) } ?? []
    }
    
    private func handleErrorResponse(error: Error) {
        // todo
    }
}
