//
//  CounterViewControllerTests.swift
//  BddCounterTests
//
//  Created by 原昂大 on 2020/11/26.
//

import XCTest
@testable import BddCounter

class CounterViewControllerTests: XCTestCase {

    func testIncrementButton() {
        let vc = CounterViewController.make()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = vc
        window.makeKeyAndVisible()
        
        XCTAssertEqual(vc.countLabel.text, "0")
        
        vc.incrementButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(vc.countLabel.text, "1")
    }
}
