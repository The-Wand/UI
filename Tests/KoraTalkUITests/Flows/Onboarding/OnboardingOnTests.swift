//
//  DUITestsLaunchTests.swift
//  DUITests
//
//  Created by Aleksander Kozin on 4/11/25.
//

import XCTest

final
class OnboardingOnTests: XCTestCase {

    class
    override
    var runsForEachTargetApplicationUIConfiguration: Bool
    {
        false
    }

    override
    func setUp()
    {
        continueAfterFailure = false
    }

    func testSeeOnboarding()
    {
        let app = XCUIApplication()
        app.launch()

        app.swipeLeft()
        app.swipeLeft()
        app.swipeLeft()
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
