//
//  CounterViewControllerTests.swift
//  BddCounterTests
//
//  Created by 原昂大 on 2020/11/26.
//

import Quick
import Nimble
@testable import BddCounter

extension UIButton {
    func tap(repeat: Int = 1) {
        for _ in 1...`repeat` {
            self.sendActions(for: .touchUpInside)
        }
    }
}

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
            
            it("「-」ボタンが非活性であること") {
                expect(vc.decrementButton.isEnabled).to(beFalse())
            }
            
            it("「+」ボタンが活性であること") {
                expect(vc.incrementButton.isEnabled).to(beTrue())
            }
        }
        
        describe("「+」ボタンをタップ") {
            context("現在値が「0」") {
                it("カウンタが「1」に増えること") {
                    vc.incrementButton.tap()
                    expect(vc.countLabel.text).to(equal("1"))
                }
                
                it("下限値でなくなるので「-」ボタンが活性になること") {
                    vc.incrementButton.tap()
                    expect(vc.decrementButton.isEnabled).to(beTrue())
                }
            }
            
            context("上限値に達した場合") {
                beforeEach {
                    vc.incrementButton.tap(repeat: 10)
                }
                
                it("上限値なので「+」ボタンが非活性になること") {
                    expect(vc.countLabel.text).to(equal("10"))
                    expect(vc.incrementButton.isEnabled).to(beFalse())
                }
            }
        }
        
        describe("「-」ボタンをタップ") {
            context("現在値が「1」") {
                beforeEach {
                    vc.incrementButton.tap()
                }
                
                it("カウンタが「0」に減ること") {
                    vc.decrementButton.tap()
                    expect(vc.countLabel.text).to(equal("0"))
                }
                
                it("下限値になるので「-」ボタンが非活性になること") {
                    vc.decrementButton.tap()
                    expect(vc.decrementButton.isEnabled).to(beFalse())
                }
            }
            
            context("現在値が「10」（上限値）") {
                beforeEach {
                    vc.incrementButton.tap(repeat: 10)
                    vc.decrementButton.tap()
                }
                it("カウンタが「9」に減ること") {
                    expect(vc.countLabel.text).to(equal("9"))
                }
                it("上限値でなくなるので「+」ボタンが活性になること") {
                    expect(vc.incrementButton.isEnabled).to(beTrue())
                }
            }
        }
    }
}
