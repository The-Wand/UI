//
//  DUITestsLaunchTests.swift
//  DUITests
//
//  Created by Aleksander Kozin on 4/11/25.
//

import XCTest

final
class OnboardingSkipTests: XCTestCase {
    
    override
    func setUp()
    {
        continueAfterFailure = false
    }

    func testDoomScrooolOnboarding()
    {
        let app = XCUIApplication()
        app.launch()

        app.swipeRight()
    }

    func testSkipOnboarding()
    {
        let app = XCUIApplication()
        app.activate()

        app.buttons["SkipButton"].tap()

        XCTAssert(
            app.textFields["PhoneField"].waitForExistence(timeout: .default)
        )
    }

}
