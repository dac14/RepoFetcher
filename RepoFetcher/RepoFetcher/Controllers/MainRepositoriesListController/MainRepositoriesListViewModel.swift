//
//  MainRepositoriesListViewModel.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 22/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import Foundation

protocol MainRepositoriesListViewModelProtocol: class {
    
}

final class MainRepositoriesListViewModel: MainRepositoriesListViewModelProtocol {
    private let coordinator: MainRepositoryListCoordinatorProtocol!
    private let service: MainRepositoryListService!
    
    init(coordinator: MainRepositoryListCoordinatorProtocol) {
        self.coordinator = coordinator
        
        // TODO REFACTOR IT LATER 
        self.service = MainRepositoryListService()
    }
}
