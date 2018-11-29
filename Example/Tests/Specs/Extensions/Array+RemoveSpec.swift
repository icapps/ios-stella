//
//  Array+RemoveSpec.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 28/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import Stella

class ArrayRemoveSpec: QuickSpec {
    override func spec() {
        describe("Array+Remove") {
            it("should return the index for the given element") {
                var array = [1, 2, 3, 4]
                expect(array.remove(3)) == 2
                expect(array) == [1, 2, 4]
            }

            it("should return no element for the given index") {
                var array = [1, 2, 3, 4]
                expect(array.remove(5)).to(beNil())
                expect(array) == [1, 2, 3, 4]
            }
        }
    }
}
