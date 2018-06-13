//
//  AppInfoSpec.swift
//  Tests
//
//  Created by Hannes Van den Berghe on 13/06/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Stella

extension AppInfoKeys {
    static let stringValue = AppInfoKey<String?>("stringValue")
    static let otherStringValue = AppInfoKey<String?>("otherStringValue")

    static let intValue = AppInfoKey<Int?>("intValue")
    static let otherIntValue = AppInfoKey<Int?>("otherIntValue")

    static let boolValue = AppInfoKey<Bool?>("boolValue")
    static let otherBoolValue = AppInfoKey<Bool?>("otherBoolValue")

    static let bundleIdentifier = AppInfoKey<String?>("CFBundleIdentifier")
    static let bundleVersion = AppInfoKey<String?>("CFBundleVersion")
}

class AppInfoSpec: QuickSpec {
    override func spec() {
        context("string value") {
            it("should be able to read the value") {
                let value = MainBundle[.stringValue]
                expect(value) == "something"
            }

            it("should not be able to read the value when it's not available") {
                let value = MainBundle[.otherStringValue]
                expect(value).to(beNil())
            }
        }

        context("int value") {
            it("should be able to read the value") {
                let value = MainBundle[.intValue]
                expect(value) == 1
            }

            it("should not be able to read the value when it's not available") {
                let value = MainBundle[.otherIntValue]
                expect(value).to(beNil())
            }
        }

        context("bool value") {
            it("should be able to read the value") {
                let value = MainBundle[.boolValue]
                expect(value).to(beTrue())
            }

            it("should not be able to read the value when it's not available") {
                let value = MainBundle[.otherBoolValue]
                expect(value).to(beNil())
            }
        }

        context("bundle") {
            it("should be able to read the correct bundle identifier") {
                let value = MainBundle[.bundleIdentifier]
                expect(value) == "com.icapps.stella.Application"
            }

            it("should be able to read the correct bundle version") {
                let value = MainBundle[.bundleVersion]
                expect(value) == "1"
            }
        }
    }
}
