//
//  Array+UniqueSpec.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 28/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import Stella

class ArrayUniqueSpec: QuickSpec {
    override func spec() {
        describe("Array+Unique") {
            it("should return an ordered array with unique elements") {
                expect([1, 2, 3, 2].unique) == [1, 2, 3]
            }
        }
    }
}
