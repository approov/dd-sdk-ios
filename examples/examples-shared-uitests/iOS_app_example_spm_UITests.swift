/*
 * Unless explicitly stated otherwise all files in this repository are licensed under the Apache License Version 2.0.
 * This product includes software developed at Datadog (https://www.datadoghq.com/).
 * Copyright 2019-2020 Datadog, Inc.
 */

import XCTest

class iOS_app_example_spm_UITests: XCTestCase {
    override func setUp() {
        continueAfterFailure = false
    }

    func testAppCanBeLaunched() {
        let app = XCUIApplication()
        app.launch()
    }
}