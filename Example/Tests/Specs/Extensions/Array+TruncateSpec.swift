//
//  Array+TruncateSpec.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 28/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import Stella

class ArrayTruncateSpec: QuickSpec {
    override func spec() {
        describe("Array+Truncate") {
            it("should return the same truncated array") {
                expect([1, 2, 3].truncate(by: 3)) == [1, 2, 3]
            }

            it("should return the truncated array") {
                expect([1, 2, 3, 4, 5].truncate(by: 3)) == [3, 4, 5]
            }
        }
    }
}
