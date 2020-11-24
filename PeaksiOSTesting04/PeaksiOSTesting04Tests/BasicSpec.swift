//
//  BasicSpec.swift
//  PeaksiOSTesting04
//
//  Created by 原昂大 on 2020/11/25.
//  
//

import Quick

class BasicSpec: QuickSpec {
    override func spec() {
        describe("String#isEmpty") {
            
            context("when an empty string is given") {
                
                it("returns true") {
                    XCTAssertTrue("".isEmpty)
                }
            }
            
            context("when string is blank") {
                
                it("returns false") {
                    XCTAssertFalse(" ".isEmpty)
                }
            }
        }
    }
}
