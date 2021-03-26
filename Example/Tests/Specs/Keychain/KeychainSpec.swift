//
//  KeychainSpec.swift
//  Stella
//
//  Created by Jelle Vandebeeck on 05/10/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Stella
import Keychain

// Define the keys used for this test.
extension Keys {
    static let stringValue = Key<String?>("stringValue")
}

private struct TestCodable: Codable, Equatable {
    var identifier: String
    var timestamp: Date
    init(identifier: String, timestamp: Date) {
        self.identifier = identifier
        self.timestamp = timestamp
    }
}

class KeychainSpec: QuickSpec {
    override func spec() {
        describe("keychain") {
            context("string value") {
                it("should be able to write to the keychain") {
                    Keychain[.stringValue] = "A string value"
                    
                    let stringValue = Keychain.load("stringValue")
                    expect(stringValue).to(equal("A string value"))
                }
                
                it("should be able to delete from the keychain") {
                    _ = Keychain.save("Some string value", forKey: "stringValue")
                    expect(Keychain[.stringValue]).to(equal("Some string value"))
                    
                    Keychain[.stringValue] = nil
                    expect(Keychain[.stringValue]).to(beNil())
                }
                
                it("should be able to read to the keychain") {
                    _ = Keychain.save("Some string value", forKey: "stringValue")
                    expect(Keychain[.stringValue]).to(equal("Some string value"))
                }

                it("should be able to write a codable value to the keychain") {
                    let value = TestCodable(identifier: "123",
                                            timestamp: Date(timeIntervalSince1970: 2000))
                    Keychain[.testKey] = value
                    expect(Keychain[.testKey]) == value
                }

                it("Should override a codable value to the keychain") {
                    let value1 = TestCodable(identifier: "123",
                                             timestamp: Date(timeIntervalSince1970: 2000))
                    let value2 = TestCodable(identifier: "456",
                                             timestamp: Date(timeIntervalSince1970: 3000))
                    Keychain[.testKey] = value1
                    Keychain[.testKey] = value2

                    expect(Keychain[.testKey]) == value2
                }

                it("should be able to delete a codable value from the keychain") {
                    let value = TestCodable(identifier: "123",
                                            timestamp: Date(timeIntervalSince1970: 2000))
                    Keychain[.testKey] = value
                    expect(Keychain[.testKey]).toNot(beNil())

                    Keychain[.testKey] = nil
                    expect(Keychain[.testKey]).to(beNil())
                }
            }
        }
        
    }
}
