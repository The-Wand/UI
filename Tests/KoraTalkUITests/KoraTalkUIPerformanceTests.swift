//
//  DUITests.swift
//  DUITests
//
//  Created by Aleksander Kozin on 4/11/25.
//

import XCTest

final
class KoraTalkUIPerformanceTests: XCTestCase {

    override
    func setUp()
    {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunchPerformance()
    throws
    {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }

}
