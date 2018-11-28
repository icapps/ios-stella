//
//  Array+ContainsSpec.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 28/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import Stella

class ArrayContainsSpec: QuickSpec {
    override func spec() {
        describe("Array+Contains") {
            it("should return true if the element is in the array") {
                expect([1, 2, 3].contains(3)) == true
            }

            it("should return false if the element is not in the array") {
                expect([1, 2, 3].contains(5)) == false
            }
        }
    }
}
