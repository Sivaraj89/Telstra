//
//  TelstraUITests.swift
//  TelstraUITests
//
//  Created by CobraAppleTV on 27/03/19.
//  Copyright © 2019 wipro. All rights reserved.
//

import XCTest

class TelstraUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        super.tearDown()
    }

    
    
    func testCollectionView() {
        let app = XCUIApplication()
        XCTAssert(app.collectionViews.element.exists)
        XCTAssertEqual(app.collectionViews.count, 1)
        XCUIDevice.shared.orientation = .landscapeRight
        XCTAssertEqual(app.collectionViews.count, 1)
        XCTAssert(app.navigationBars["About Canada"].exists)
    }
    
    
    func testRefreshAction(){
        let app = XCUIApplication()
        let refreshButton = app.navigationBars["About Canada"].buttons["Refresh"]
        refreshButton.tap()
        XCTAssert(app.collectionViews.element.exists)
        XCTAssertEqual(app.collectionViews.count, 1)
        XCTAssert(app.navigationBars["About Canada"].exists)
        XCUIDevice.shared.orientation = .landscapeRight
        refreshButton.tap()
        XCTAssert(app.collectionViews.element.exists)
        XCTAssertEqual(app.collectionViews.count, 1)
        XCTAssert(app.navigationBars["About Canada"].exists)
    }

}
