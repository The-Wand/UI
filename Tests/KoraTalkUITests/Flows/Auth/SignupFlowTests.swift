//
//  AuthFlowTests.swift
//  AuthFlowTests
//
//  Created by Aleksander Kozin on 4/11/25.
//

import XCTest

final
class SignupFlowTests: XCTestCase {

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

    func test2_Signup()
    {
        let app = XCUIApplication()
        app.activate()

        app.textFields["PhoneField"].tap()
        app.textFields["PhoneField"].typeText("77000000000")

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
            app.textFields["Name"].waitForExistence(timeout: .default)
        )
    }

    func test4_FillData()
    {
        let app = XCUIApplication()
        app.activate()

        app.textFields["Name"].typeText("theusers_Name")
        app.textFields["UserName"].typeText("theusers_UserName\(arc4random_uniform(.max)))")
        app.textFields["UserDescription"].typeText("theusers_Description")

        app.textFields["Gender"].typeText("\(Bool.random())")

        app.textFields["Birthdate"].typeText("18 янв. 2025")

        app.buttons["Other"].tap()

        app.buttons["Save"].tap()
    }

    override
    class
    func tearDown()
    {
        let app = XCUIApplication()
        app.uninstall()
    }

}
