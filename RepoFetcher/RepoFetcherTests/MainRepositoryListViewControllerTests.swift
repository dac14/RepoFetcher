//
//  MainRepositoryListViewControllerTests.swift
//  RepoFetcherTests
//
//  Created by Arkadiusz Buraczek on 29/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import XCTest

class MainRepositoryListViewControllerTests: XCTestCase {
    
    private var viewModel: MainRepositoriesListViewModel!
    private var viewController: MainRepositoriesListViewController!

    override func setUp() {
        viewModel = MainRepositoriesListViewModel(coordinator: MainRepositoryListCoordinator(coordinator: AppCoordinator(window: UIWindow()), navigationController: UINavigationController()))
        viewController = MainRepositoriesListViewController(viewModel: viewModel)
    }

    override func tearDown() {
        viewModel = nil
        viewController = nil
    }

    func testSetTitle() {
        // GIVEN
        let title = "title"
        
        // WHEN
        viewController.setTitle(with: title)
        
        // THEN
        XCTAssertEqual(viewController.title, title)
    }

    func testShowIndicator() {
        // GIVEN
        XCTAssertEqual(viewController.activityIndicator.isHidden, true)
        
        // WHEN
        viewController.showIndicator(shouldShow: true)
        
        // THEN
        XCTAssertEqual(viewController.activityIndicator.isHidden, false)
        
        // After test hide indicator
        viewController.showIndicator(shouldShow: false)
    }
    
    func testHideIndicator() {
        // GIVEN
        viewController.showIndicator(shouldShow: true)
        XCTAssertEqual(viewController.activityIndicator.isHidden, false)
        
        // WHEN
        viewController.showIndicator(shouldShow: false)
        
        // THEN
        XCTAssertEqual(viewController.activityIndicator.isHidden, true)
    }

}
