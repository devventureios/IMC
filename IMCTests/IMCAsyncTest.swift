//
//  IMCAsyncTest.swift
//  IMCTests
//
//  Created by Eric Alves Brito on 06/06/20.
//  Copyright © 2020 Eric Brito. All rights reserved.
//

import XCTest

struct Brand: Codable {
    let name: String
    let fipeName: String
    let order: Int
    let key: String
    let id: Int
}

class IMCAsyncTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAsync() throws {
        //https://fipeapi.appspot.com/api/1/carros/marcas.json
        
        //Given
        let url = URL(string: "https://fipeapi.appspot.com/api/1/carros/marcas.json")!
        let promise = expectation(description: "API retorne dados válidos")
        
        //When
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            defer {
                promise.fulfill()
            }
            XCTAssertNil(error)
            do {
                
                let response = try XCTUnwrap(response as? HTTPURLResponse)
                let data = try XCTUnwrap(data)
                XCTAssertEqual(response.statusCode, 200, "Status conde inválido")
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                var brands: [Brand] = []
                XCTAssertNoThrow(brands = try jsonDecoder.decode([Brand].self, from: data))
                XCTAssertGreaterThan(brands.count, 0)
                
            } catch {
                XCTFail("Alguma coisa foi capturada no catch")
            }
        }.resume()

        waitForExpectations(timeout: 3.0)
    }


}
