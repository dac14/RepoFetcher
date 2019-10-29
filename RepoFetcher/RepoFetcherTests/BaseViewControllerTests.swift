//
//  BaseViewControllerTests.swift
//  RepoFetcherTests
//
//  Created by Arkadiusz Buraczek on 29/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import XCTest

class BaseViewControllerTests: XCTestCase {

    private var baseViewController: BaseViewController!
    
    override func setUp() {
        baseViewController = BaseViewController()
    }

    override func tearDown() {
        baseViewController = nil
    }

    func testShowActivityIndicator() {
        // GIVEN
        baseViewController.hideActivityIndicator()
        XCTAssertEqual(baseViewController.activityIndicator.isHidden, true, "ActivityIndicator should be hidden")
        
        // WHEN
        
        baseViewController.showActivityIndicator()
        
        // THEN
        XCTAssertEqual(baseViewController.activityIndicator.isHidden, false, "ActivityIndicator should be visible")
    }
    
    func testHideActivityIndicator() {
        // GIVEN
        baseViewController.showActivityIndicator()
        XCTAssertEqual(baseViewController.activityIndicator.isHidden, false, "ActivityIndicator should be visible")
        
        // WHEN
        baseViewController.hideActivityIndicator()
        
        // THEN
        XCTAssertEqual(baseViewController.activityIndicator.isHidden, true, "ActivityIndicator should be hidden")
    }

    func testUserInteractionIsOfWhenActivityIndicatorIsOn() {
        // GIVEN
        baseViewController.hideActivityIndicator()
        XCTAssertEqual(baseViewController.activityIndicator.isHidden, true, "ActivityIndicator should be hidden")
        XCTAssertEqual(baseViewController.view.isUserInteractionEnabled, true, "User interaction should be on")
        
        // WHEN
        baseViewController.showActivityIndicator()
        
        // THEN
        XCTAssertEqual(baseViewController.view.isUserInteractionEnabled, false, "User Interaction should be off")
    }

}
