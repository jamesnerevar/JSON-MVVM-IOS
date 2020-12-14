//
//  JSON_MVVM_IOSUITests.swift
//  JSON-MVVM-IOSUITests
//
//  Created by James Jasenia on 11/11/20.
//

import XCTest

class JSON_MVVM_IOSUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app.launchEnvironment = ["ENVIRONMENT" : "TEST"]
        app.launch()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEmptyCityTextFieldAlert() {
        //Arange
        app.launchEnvironment = ["ENVIRONMENT" : "TEST"]
        app.launch()
        
        //Act
        app.buttons.element.tap()
        
        //Assert
        XCTAssertTrue(app.staticTexts["AlertHeader"].label == "Invalid City Name")
        XCTAssertTrue(app.staticTexts["AlertSubheader"].label == "Please enter a valid city name")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
