//
//  FizzBuzzTests.swift
//  FizzBuzzTests
//
//  Created by KimJunsoo on 4/14/25.
//

import XCTest

final class FizzBuzzTests: XCTestCase {
    override func setUpWithError() throws {
        print("setUpWithError")
    }
    
    override func tearDownWithError() throws {
        print("tearDownWithError")
    }
    
    func testFizzBuzzDivisibleBy3() throws {
        let result = fizzBuzz(3)
        XCTAssertEqual(result, "fizz")
    }
    func testFizzBuzzDivisibleBy5() throws {
        let result = fizzBuzz(5)
        XCTAssertEqual(result, "buzz")
    }
    func testFizzBuzzDivisibleBy15() throws {
        let result = fizzBuzz(15)
        XCTAssertEqual(result, "fizz-buzz")
    }
    func testFizzBuzzDivisibleBy30r5ReturnUnput() throws {
        let result = fizzBuzz(7)
        XCTAssertEqual(result, "7")
    }
    
    func testAsyncSum() async throws {
        await asyncSum(a: 3, b: 5) {
            result in
            XCTAssertEqual(result, 8)
        }
    }
}
