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
                        existingArray.addIfNeeded(expected)
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
                }
            }
        }
    }
    
}
