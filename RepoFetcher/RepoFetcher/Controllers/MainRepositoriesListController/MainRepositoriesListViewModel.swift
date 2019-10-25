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
    func showIndicator(shouldShow: Bool)
    func setTitle(with text: String)
}

protocol MainRepositoriesListViewModelProtocol: class {
    func fetchRepositoriesData()
    func item(at index: Int) -> RepositoryRenderable
    func isNotLoadedCell(for indexPath: IndexPath) -> Bool
    func loadNextRepositories()
    
    var delegate: MainRepositoriesListViewModelDelegate? { get set }
    var newValues: [RepositoryRenderable] { get }
    var numberOfItemsInDataSource: Int { get }
    var dataSource: [RepositoryRenderable] { get }
}

final class MainRepositoriesListViewModel: MainRepositoriesListViewModelProtocol {
    
    private enum Constants {
        static let numberOfDaysBeforeNow = 30
    }
    
    private let coordinator: MainRepositoryListCoordinatorProtocol!
    private let worker: MainRepositoriesListWorkerProtocol
    private var dateFormatter: DateFormatter {
       let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        return formatter
    }
    
    private var disposeBag = DisposeBag()
    private var currentPage: Int = 1
    
    private var repositoriesRenderables: [RepositoryRenderable] = [] {
        didSet {
            delegate?.update(with: newValues)
        }
    }
    
    var newValues: [RepositoryRenderable] = [] {
        didSet {
            repositoriesRenderables.append(contentsOf: newValues)
        }
    }
    
    weak var delegate: MainRepositoriesListViewModelDelegate? {
        didSet {
            setup()
        }
    }
    
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
        cancelRequest()
        delegate?.showIndicator(shouldShow: true)
        
        worker.fetchRepositoriesList(from: getDateMonthBeforeNow(), page: getCurrentPageNumber())
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
    
    func isNotLoadedCell(for indexPath: IndexPath) -> Bool {
        let paginatedIndex = dataSource.index(before: dataSource.endIndex)
        
        return indexPath.item >= paginatedIndex
    }
    
    func loadNextRepositories() {
        fetchRepositoriesData()
    }
    
    private func setup() {
        fetchRepositoriesData()
        delegate?.setTitle(with: NSLocalizedString("repositories_list_title", comment: ""))
    }
    
    private func cancelRequest() {
        disposeBag = DisposeBag()
    }
    
    private func increasePageCounter() {
        currentPage += 1
    }
    
    private func getCurrentPageNumber() -> String {
        return "\(currentPage)"
    }
    
    private func getDateMonthBeforeNow() -> String {
        guard let date = Calendar.current.date(byAdding: .day, value: -Constants.numberOfDaysBeforeNow, to: Date()) else {
            return dateFormatter.string(from: Date())
        }
        
        return dateFormatter.string(from: date)
    }
    
    private func handleSuccessResponse(with response: RepositoriesListResponse) {
        delegate?.showIndicator(shouldShow: false)
        increasePageCounter()
        newValues = response.items?.compactMap { RepositoryRenderable(item: $0) } ?? []
    }
    
    private func handleErrorResponse(error: Error) {
        delegate?.showIndicator(shouldShow: false)
        // todo
    }
}
