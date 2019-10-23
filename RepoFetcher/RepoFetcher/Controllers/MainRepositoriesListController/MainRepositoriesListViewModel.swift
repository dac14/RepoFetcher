//
//  MainRepositoriesListViewModel.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 22/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import RxSwift

protocol MainRepositoriesListViewModelProtocol: class {
    
}

final class MainRepositoriesListViewModel: MainRepositoriesListViewModelProtocol {
    private let coordinator: MainRepositoryListCoordinatorProtocol!
    private let worker: MainRepositoriesListWorkerProtocol
    private let disposeBag = DisposeBag()
    
    init(coordinator: MainRepositoryListCoordinatorProtocol, worker: MainRepositoriesListWorkerProtocol = MainRepositoriesListWorker()) {
        self.coordinator = coordinator
        self.worker = worker
    }
}
