//
//  AppCoordinator.swift
//  RepoFetcher
//
//  Created by Arkadiusz Buraczek on 22/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import UIKit

protocol AppCoordinatorProtocol: Coordinator {
    init(window: UIWindow?, navigationController: UINavigationController)
}

final class AppCoordinator: AppCoordinatorProtocol {
    private let navigationController: UINavigationController
    
    private weak var window: UIWindow?
    
    private var mainRepositoryListCoordinator: MainRepositoryListCoordinator?
    
    init(window: UIWindow?, navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
        window?.rootViewController = navigationController
    }
    
    func start() {
        mainRepositoryListCoordinator = MainRepositoryListCoordinator(coordinator: self, navigationController: navigationController)
        mainRepositoryListCoordinator?.start()
    }
}
