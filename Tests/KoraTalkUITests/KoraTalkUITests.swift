//
//  DUITestsLaunchTests.swift
//  DUITests
//
//  Created by Aleksander Kozin on 4/11/25.
//

import XCTest

extension TimeInterval {

    static
    var `default`: Self = 10

}

final
class KoraTalkUITests: XCTestCase {

    override
    func setUpWithError()
    throws
    {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch()
    throws
    {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }

}
