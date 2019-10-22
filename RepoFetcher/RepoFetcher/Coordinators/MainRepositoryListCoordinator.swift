//
//  MainRepositoryListCoordinator.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 22/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import UIKit

protocol MainRepositoryListCoordinatorProtocol: Coordinator {
    init(coordinator: Coordinator, navigationController: UINavigationController)
}

final class MainRepositoryListCoordinator: MainRepositoryListCoordinatorProtocol {
    private weak var parentCoordinator: Coordinator?
    private weak var navigationController: UINavigationController?
    
    init(coordinator: Coordinator, navigationController: UINavigationController) {
        self.parentCoordinator = coordinator
        self.navigationController = navigationController
    }
    
    func start() {
        openMainRepositoryView()
    }
    
    private func openMainRepositoryView() {
        let viewModel = MainRepositoriesListViewModel(coordinator: self)
        let viewController = MainRepositoriesListViewController(viewModel: viewModel)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
