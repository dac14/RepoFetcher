//
//  AppCoordinatorTests.swift
//  RepoFetcherTests
//
//  Created by Arkadiusz Buraczek on 29/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import XCTest

class AppCoordinatorTests: XCTestCase {
    
    private var appCoordinator: AppCoordinator!
    private var navigationController: UINavigationController!

    override func setUp() {
        navigationController = UINavigationController()
        appCoordinator = AppCoordinator(window: UIWindow(), navigationController: navigationController)
    }

    override func tearDown() {
        appCoordinator = nil
    }

    func testNavigateToMainListController() {
        // GIVEN
        XCTAssertEqual(navigationController.viewControllers.count, .zero)
        
        // WHEN
        appCoordinator.start()
        
        // THEN
        XCTAssertGreaterThan(navigationController.viewControllers.count, .zero)
        
    }

    func testDidNavigateToMainListController() {
        // GIVEN
        navigationController.popToRootViewController(animated: false)
        
        // WHEN
        appCoordinator.start()
        
        // THEN
        XCTAssertGreaterThan(navigationController.viewControllers.count, .zero)
        XCTAssertTrue((navigationController.viewControllers.first as? MainRepositoriesListViewController?) != nil)
    }

}
