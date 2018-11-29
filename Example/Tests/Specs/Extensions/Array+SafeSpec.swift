//
//  ArraySafeSpec.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 11/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import Stella

class ArraySafeSpec: QuickSpec {
    override func spec() {
        describe("Array+Safe") {
            let list = [0, 1, 2, 3, 4]
            
            it("should return the element for the given index") {
                expect(list[safe: 1]) == 1
            }
            
            it("should return nil when the index is lower than 0") {
                expect(list[safe: -1]).to(beNil())
            }
            
            it("should return nil when the index is higher than the array count") {
                expect(list[safe: 5]).to(beNil())
            }
        }
    }
}
