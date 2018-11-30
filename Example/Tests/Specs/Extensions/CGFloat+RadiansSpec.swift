//
//  CGFloat+Radians.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 30/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import Stella

class FloatRadiansSpec: QuickSpec {
    override func spec() {
        describe("CGFloat+Radians") {
            it("Convert degrees to radians") {
                expect(CGFloat(180).degreesToRadians) == .pi
            }

            it("convert radians to degrees") {
                expect(CGFloat.pi.radiansToDegrees) == 180.0
            }
        }
    }
}
