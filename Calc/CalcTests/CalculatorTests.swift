//
//  CalculatorTests.swift
//  CalcTests
//
//  Created by 原昂大 on 2020/11/23.
//

import XCTest
@testable import Calc

class CalculatorTests: XCTestCase {

    func testAdd() {
        let calculator = Calculator()
        let result = calculator.add(1, 2)
        XCTAssertEqual(result, 3)
    }
}
