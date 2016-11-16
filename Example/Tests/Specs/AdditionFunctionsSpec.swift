//
//  File.swift
//  Stella
//
//  Created by Stijn Willems on 16/11/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import Quick
import Nimble

import Stella

class AdditionFunctionsSpec: QuickSpec {

    override func spec() {
        describe("AdditionFunctionsSpec") {

            let existingObject = "Something"
            let existingArray = [existingObject]

            context("Add if not yet contained") {

                it("object"){
                    let expected = "Somethingelse"
                    let result = addIfNeeded(to: existingArray, from: expected)

                    expect(result[1]) == expected
                }

                it("array with ALL new") {
                    let expected = ["A", "B"]

                    let result = addIfNeeded(to: existingArray, from: expected)

                    expect(result[1]) == expected[0]
                    expect(result[2]) == expected[1]
                }


                it("array with SOME new") {
                    let expected = [existingObject, "A", "B"]

                    let result = addIfNeeded(to: existingArray, from: expected)

                    expect(result[1]) == expected[1]
                    expect(result[2]) == expected[2]
                }
            }

            context("NO duplicates") {

                it("object") {
                    let result = addIfNeeded(to: existingArray, from: existingObject)

                    expect(result[0]) == existingObject
                    expect(result.count) == 1
                }

                it("array with ALL existing") {
                    let newElement = "new element"
                    let testArray = addIfNeeded(to: existingArray, from: newElement)
                    let expected = [existingObject, newElement]

                    let result = addIfNeeded(to: testArray, from: expected)

                    expect(result[0]) == existingObject
                    expect(result[1]) == newElement
                    expect(result.count) == 2
                }
            }
        }
    }
    
}
