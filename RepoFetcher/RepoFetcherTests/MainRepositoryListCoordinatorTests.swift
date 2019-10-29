//
//  MainRepositoryListCoordinatorTests.swift
//  RepoFetcherTests
//
//  Created by Arkadiusz Buraczek on 29/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import XCTest

class MainRepositoryListCoordinatorTests: XCTestCase {
    
    private var appCoordinator: AppCoordinator!
    private var mainRepositoryCoordinator: MainRepositoryListCoordinator!
    private var navigationController: UINavigationController!
    

    override func setUp() {
        navigationController = UINavigationController()
        appCoordinator = AppCoordinator(window: UIWindow(), navigationController:   navigationController)
        mainRepositoryCoordinator = MainRepositoryListCoordinator(coordinator: appCoordinator, navigationController: navigationController)
    }

    override func tearDown() {
        appCoordinator = nil
        navigationController = nil
        mainRepositoryCoordinator = nil
    }

    func testDidCoordinatorStartProperly() {
        // GIVEN
        let navigationController = self.navigationController
        let mainRepositoryCoordinator = self.mainRepositoryCoordinator
        
        // WHEN
        mainRepositoryCoordinator?.start()
        
        // THEN
        XCTAssertGreaterThan(navigationController!.viewControllers.count, .zero)
        XCTAssertTrue((navigationController?.viewControllers.first as? MainRepositoriesListViewController) != nil)
    }
}
