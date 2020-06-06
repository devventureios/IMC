//
//  IMCUITests.swift
//  IMCUITests
//
//  Created by Eric Alves Brito on 06/06/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import XCTest

class IMCUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        let tfWeight = app.textFields["Ex.: 75"]
        tfWeight.tap()
        tfWeight.typeText("75")
        
        let tfHeight = app.textFields["Ex.: 1.75"]
        tfHeight.tap()
        tfHeight.typeText("1.75")
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Calcular"]/*[[".buttons[\"Calcular\"].staticTexts[\"Calcular\"]",".staticTexts[\"Calcular\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        XCTAssert(app.staticTexts["24: Peso ideal"].exists, "Label de resultados não foi apresentados corretamente")
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
