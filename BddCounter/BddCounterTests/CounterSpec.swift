//
//  CounterSpec.swift
//  BddCounter
//
//  Created by 原昂大 on 2020/11/27.
//  
//

import Quick
import Nimble
@testable import BddCounter

class CounterSpec: QuickSpec {
    override func spec() {
        
        describe("#init") {
            context("引数なしで初期化") {
                it("countが「0」であること") {
                    expect(Counter().count).to(equal(0))
                }
            }
            context("引数「5」で初期化") {
                it("countが「5」であること") {
                    expect(Counter(count: 5).count).to(equal(5))
                }
            }
        }
        
        describe("#increment / #decrement") {
            context("現在値が「5」") {
                var counter: Counter!
                
                beforeEach {
                    counter = Counter(count: 5)
                }
                it("incrementすると6になること") {
                    counter.increment()
                    expect(counter.count).to(equal(6))
                }
                it("decrementすると4になること") {
                    counter.decrement()
                    expect(counter.count).to(equal(4))
                }
            }
        }
        
        describe("#isNotLowerLimit") {
            context("現在値が「0」") {
                it("falseを返すこと") {
                    expect(Counter().isNotLowerLimit).to(beFalse())
                }
            }
            context("現在値が「1」") {
                it("trueを返すこと") {
                    expect(Counter(count: 1).isNotLowerLimit).to(beTrue())
                }
            }
        }
        
        describe("#isNotUpperLimit") {
            context("現在値が「9」") {
                it("trueを返すこと") {
                    expect(Counter(count: 9).isNotUpperLimit).to(beTrue())
                }
            }
            context("現在値が「10」") {
                it("falseを返すこと") {
                    expect(Counter(count: 10).isNotUpperLimit).to(beFalse())
                }
            }
        }
    }
}
