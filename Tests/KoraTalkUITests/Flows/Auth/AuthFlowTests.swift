//
//  AuthFlowTests.swift
//  AuthFlowTests
//
//  Created by Aleksander Kozin on 4/11/25.
//

import XCTest

final
class AuthFlowTests: XCTestCase {

    override
    func setUp()
    {
        continueAfterFailure = false
    }

    func test1_Skip()
    {
        let app = XCUIApplication()
        app.launch()

        app.buttons["SkipButton"].tap()
        
        XCTAssert(
            app.textFields["PhoneField"].waitForExistence(timeout: .default)
        )
    }

    func test2_Authorize()
    {
        let app = XCUIApplication()
        app.activate()

        app.textFields["PhoneField"].tap()
        app.textFields["PhoneField"].typeText("77759758645")

        app.buttons["PrimaryButton"].tap()

        XCTAssert(
            app.textFields["OTP"].waitForExistence(timeout: .default)
        )
    }

    func test3_OTP()
    {
        let app = XCUIApplication()
        app.activate()

        app.textFields["OTP"].typeText("1234")
        
        XCTAssert(
            app.searchFields["SearchFlow"].waitForExistence(timeout: .default)
        )
    }

    override
    class
    func tearDown()
    {
        let app = XCUIApplication()
        app.uninstall()
    }

}
