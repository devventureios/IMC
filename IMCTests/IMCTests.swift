//
//  IMCTests.swift
//  IMCTests
//
//  Created by Eric Alves Brito on 05/06/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import XCTest
@testable import IMC

class IMCTests: XCTestCase {

    //System Under Test
    var sut: IMCCalculator!
    
    override func setUpWithError() throws {
        try? super.setUpWithError()
        sut = IMCCalculator()
    }

    override func tearDownWithError() throws {
        sut = nil
        try? super.tearDownWithError()
    }
    
    //TDD: Test Driven Development -> Red, Green, Refactor
    func testObesity() {
        //Gherky Sintax
        //Given
        let weight = 90.0
        let height = 1.45
        
        //When
        sut.refresh(weight: weight, height: height)
        
        //Then
        let expectedResult = "42: Obesidade"
        XCTAssertEqual(expectedResult, sut.result, "O resultado de obesidade não foi o esperado")
    }
    
    func testThinnes() {
        //Given
        let weight = 45.0
        let height = 1.90
        
        //Then
        sut.refresh(weight: weight, height: height)
        
        //When
        let expectedResult = "12: Magreza"
        XCTAssertEqual(expectedResult, sut.result, "Magreza não bate")
    }
    
    func testOverWithAccuracy() {
        //Given
        let weight = 75.0
        let height = 1.60
        
        //Then
        sut.refresh(weight: weight, height: height)
        
        //When
        let expectedResult = 29.0
        XCTAssertEqual(expectedResult, sut.value, accuracy: 0.5, "Valores de sobrepeso não batem")
    }

}
