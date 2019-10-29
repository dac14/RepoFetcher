//
//  ReposityryRenderableTests.swift
//  RepoFetcherTests
//
//  Created by Arkadiusz Buraczek on 29/10/2019.
//  Copyright © 2019 Arkadiusz Buraczek. All rights reserved.
//

import XCTest

class ReposityryRenderableFormatterTests: XCTestCase {
    private var formatter: RepositoryRenderableStarFormatter!

    override func setUp() {
        formatter = RepositoryRenderableStarFormatter()
    }

    override func tearDown() {
        formatter = nil
    }

    func testRepositoryFormatterSuccessWithBigNumber() {
        // GIVEN
        let value = 9830
        var formattedStringValue: String
        
        // WHEN
        formattedStringValue = formatter.formatStars(count: value)
        
        // THEN
        XCTAssertEqual(formattedStringValue, "9.8 k")
    }

    func testRepositoryFormatterSuccessWithSmallNumber() {
        // GIVEN
        let value = 40
        var formattedStringValue: String
        
        // WHEN
        formattedStringValue = formatter.formatStars(count: value)
        
        // THEN
        XCTAssertEqual(formattedStringValue, "40")
    }

}
