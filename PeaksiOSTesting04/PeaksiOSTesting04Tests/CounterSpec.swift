//
//  CounterSpec.swift
//  PeaksiOSTesting04
//
//  Created by 原昂大 on 2020/11/25.
//  
//

import Quick

struct Counter {
    var count: Int = 0
    
    mutating func increment() {
        count += 1
    }
    
    mutating func reset(_ value: Int = 0) {
        count = value
    }
}

class CounterSpec: QuickSpec {
    override func spec() {
        describe("Counter") {
            var counter: Counter!
            
            beforeEach {
                counter = Counter()
            }
            
            describe("#increment") {
                context("値を更新した後にインクリメント") {
                    
                    beforeEach {
                        counter.reset(10)
                    }
                    
                    context("1回だけ呼び出し") {
                        it("countが11になること") {
                            counter.increment()
                            XCTAssertEqual(counter.count, 11)
                        }
                    }
                    
                    context("2回だけ呼び出し") {
                        it("countが12になること") {
                            counter.increment()
                            counter.increment()
                            XCTAssertEqual(counter.count, 12)
                        }
                    }
                }
            }
        }
    }
}

class CountableBehavior: Behavior<Int> {
    override static func spec(_ aContext: @escaping () -> Int) {
        var counter: Counter!
        var initial: Int!
        
        beforeEach {
            initial = aContext()
            
            counter = Counter()
            counter.reset(initial)
            counter.increment()
            counter.increment()
        }
        
        it("incrementを2回呼び出したら、現在の値+2されること") {
            XCTAssertEqual(counter.count, initial + 2)
        }
    }
}

class CountableBehaviorSpec: QuickSpec {
    override func spec() {
        describe("Counter") {
            itBehavesLike(CountableBehavior.self) { 0 }
            itBehavesLike(CountableBehavior.self) { 1 }
        }
    }
}
