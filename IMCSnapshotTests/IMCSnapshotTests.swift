//
//  IMCSnapshotTests.swift
//  IMCSnapshotTests
//
//  Created by Eric Alves Brito on 06/06/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import FBSnapshotTestCase
@testable import IMC

class IMCSnapshotTests: FBSnapshotTestCase {

    var sut: ViewController!
    
    override func setUp() {
        super.setUp()
        recordMode = false
        fileNameOptions = [.device, .screenSize]
        usesDrawViewHierarchyInRect = true
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        sut.loadView()
    }

    override func tearDownWithError() throws {
        sut = nil
        try? super.tearDownWithError()
    }

    func testView() throws {
        FBSnapshotVerifyView(sut.view)
    }

    func testObesity() throws {
        //Given
        sut.tfWeight.text = "90.0"
        sut.tfHeight.text = "1.45"
        
        //When
        sut.calculate(nil)
        
        //Then
        FBSnapshotVerifyView(sut.view)
    }

}
