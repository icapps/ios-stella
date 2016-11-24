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

class ArrayExtensionSpec: QuickSpec {

    override func spec() {
        describe("ArrayExtensionSpec") {

            let existingObject = "Something"
            var existingArray: [String]!

            describe("ADD") {
                context("Add if not yet contained") {
                    beforeEach {
                        existingArray = [existingObject]
                    }

                    it("object"){
                        let expected = "Somethingelse"
                        expect(existingArray.addIfNeeded(expected)) == true
                        expect(existingArray[1]) == expected
                    }

                    it("array with ALL new") {
                        let expected = ["A", "B"]

                        existingArray.addIfNeeded(expected)

                        expect(existingArray[1]) == expected[0]
                        expect(existingArray[2]) == expected[1]
                    }


                    it("array with SOME new") {
                        let expected = [existingObject, "A", "B"]

                        existingArray.addIfNeeded(expected)

                        expect(existingArray[1]) == expected[1]
                        expect(existingArray[2]) == expected[2]
                    }
                }

                context("NO duplicates") {

                    beforeEach {
                        existingArray = [existingObject]
                    }

                    it("object") {
                        existingArray.addIfNeeded(existingObject)

                        expect(existingArray[0]) == existingObject
                        expect(existingArray.count) == 1
                    }

                    it("array with ALL existing") {
                        let newElement = "new element"
                        existingArray.addIfNeeded(newElement)
                        let expected = [existingObject, newElement]
                        
                        existingArray.addIfNeeded(expected)
                        
                        expect(existingArray[0]) == existingObject
                        expect(existingArray[1]) == newElement
                        expect(existingArray.count) == 2
                    }

                    it("The same elements not yet in array") {
                        let sameElements = ["Z","Z","Z","Z","Z","Z"]

                        existingArray.addIfNeeded(sameElements)

                        expect(existingArray).to(haveCount(2))
                    }

                    it("unique an array") {
                        var sameElements = ["Z","Z","Z","A","A","Z"]

                        sameElements.uniq()

                        expect(sameElements).to(haveCount(2))
                    }
                }
            }

            describe("DELETE") {

                beforeEach {
                    existingArray = [existingObject]
                }

                it("existing") {
                    expect(existingArray.deleteIfNeeded([existingObject])) == true

                    expect(existingArray).to(beEmpty())
                }

                it("extra") {
                    let extraElement = "extra"
                    existingArray.append(extraElement)

                    expect(existingArray.deleteIfNeeded([existingObject])) == true
                    expect(existingArray).to(haveCount(1))
                }

                it("non existing") {
                    expect(existingArray.deleteIfNeeded(["bullshit"])) == false
                }

                it("maintain order") {
                    existingArray.append("A")
                    existingArray.append("B")

                    existingArray.deleteIfNeeded(["A"])
                    expect(existingArray[0]) == existingObject
                    expect(existingArray[1]) == "B"
                }

                it("Delete one element") {
                    existingArray.append(contentsOf: ["A", "B"])

                    existingArray.deleteIfNeeded([existingObject, "B"])

                    expect(existingArray).to(haveCount(1))
                    expect(existingArray.first) == "A"
                }

            }
        }
    }
    
}
