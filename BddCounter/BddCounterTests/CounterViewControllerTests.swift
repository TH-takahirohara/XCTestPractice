//
//  CounterViewControllerTests.swift
//  BddCounterTests
//
//  Created by 原昂大 on 2020/11/26.
//

import Quick
import Nimble
@testable import BddCounter

class CounterViewControllerSpec: QuickSpec {
    override func spec() {
        var vc: CounterViewController!
        
        beforeEach {
            vc = CounterViewController.make()
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = vc
            window.makeKeyAndVisible()
        }
        
        describe("初期表示") {
            it("カウントが「0」であること") {
                expect(vc.countLabel.text).to(equal("0"))
            }
        }
        
        describe("「+」ボタンをタップ") {
            context("現在値が「0」") {
                it("カウンタが「1」に増えること") {
                    vc.incrementButton.sendActions(for: .touchUpInside)
                    expect(vc.countLabel.text).to(equal("1"))
                }
            }
        }
    }
}
