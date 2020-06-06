//
//  IMCControllerTest.swift
//  IMCTests
//
//  Created by Eric Alves Brito on 05/06/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import XCTest
@testable import IMC

class IMCControllerTest: XCTestCase {

    var sut: ViewController!
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
    }

    override func tearDownWithError() throws {
        sut = nil
        try? super.tearDownWithError()
    }

    func testShowResults() {
        //Given
        sut.loadView()
        sut.tfWeight.text = "70.0"
        sut.tfHeight.text = "1.70"
        
        //When
        sut.calculate(nil)
        
        //Then
        XCTAssertEqual(sut.lbResult.text!, "24: Peso ideal", "Peso errado apresentado")
    }

}
