//
//  DefaultsSpec.swift
//  Stella
//
//  Created by Jelle Vandebeeck on 08/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Stella

/// An enum for our enumStringTypeValue test case
enum SomeStringEnum: String {
    case type1
    case type2
    case type3
}

/// An enum for our enumStringTypeValue test case
enum SomeIntEnum: Int {
    case type1
    case type2
    case type3
}

// Define the keys used for this test.
extension DefaultsKeys {
    static let enumStringTypeValue = DefaultsKey<SomeStringEnum?>("enumStringTypeValue")
    static let enumIntTypeValue = DefaultsKey<SomeIntEnum?>("enumIntTypeValue")
    static let stringValue = DefaultsKey<String?>("stringValue")
    static let integerValue = DefaultsKey<Int?>("integerValue")
    static let doubleValue = DefaultsKey<Double?>("doubleValue")
    static let floatValue = DefaultsKey<Float?>("floatValue")
    static let booleanValue = DefaultsKey<Bool?>("booleanValue")
    static let dateValue = DefaultsKey<Date?>("dateValue")
    static let stringsValue = DefaultsKey<[String]?>("stringsValue")
}

class DefaultsSpec: QuickSpec {
    // swiftlint:disable function_body_length
    override func spec() {
        describe("defaults") {
            context("enumType value + String") {
                it("should be able to write to the defaults") {
                    Defaults[.enumStringTypeValue] = .type1
                    let value = UserDefaults.standard.string(forKey: "enumStringTypeValue") ?? ""
                    let enumTypeValue = SomeStringEnum(rawValue: value)
                    expect(enumTypeValue).to(equal(.type1))
                }
                
                it("should be able to clear the defaults") {
                    Defaults[.enumStringTypeValue] = .type1
                    Defaults[.enumStringTypeValue] = nil
                    let value = UserDefaults.standard.string(forKey: "enumStringTypeValue") ?? ""
                    let stringValue = SomeStringEnum(rawValue: value)
                    expect(stringValue).to(beNil())
                }
                
                it("should be able to read from the defaults") {
                    UserDefaults.standard.set("type1", forKey: "enumStringTypeValue")
                    expect(Defaults[.enumStringTypeValue]).to(equal(.type1))
                }
            }
            
            context("enumType value + Int") {
                it("should be able to write to the defaults") {
                    Defaults[.enumIntTypeValue] = .type1
                    let enumTypeValue = SomeIntEnum(rawValue: UserDefaults.standard.integer(forKey: "enumIntTypeValue"))
                    expect(enumTypeValue).to(equal(.type1))
                }
                
                // We will not be able to clear the defaults because this will always return a 0 integer
                // 0 integer == first case -> .type1
                it("should not be able to clear the defaults") {
                    Defaults[.enumIntTypeValue] = .type1
                    Defaults[.enumIntTypeValue] = nil
                    let stringValue = SomeIntEnum(rawValue: UserDefaults.standard.integer(forKey: "enumIntTypeValue"))
                    expect(stringValue).to(equal(.type1))
                }
                
                it("should be able to read from the defaults") {
                    UserDefaults.standard.set("type1", forKey: "enumIntTypeValue")
                    expect(Defaults[.enumIntTypeValue]).to(equal(.type1))
                }
            }
            
            context("string value") {
                it("should be able to write to the defaults") {
                    Defaults[.stringValue] = "A string value"
                    let stringValue = UserDefaults.standard.string(forKey: "stringValue")
                    expect(stringValue).to(equal("A string value"))
                }

                it("should be able to clear the defaults") {
                    Defaults[.stringValue] = "A string value"
                    Defaults[.stringValue] = nil
                    let stringValue = UserDefaults.standard.string(forKey: "stringValue")
                    expect(stringValue).to(beNil())
                }
                
                it("should be able to read to the defaults") {
                    UserDefaults.standard.set("Some string value", forKey: "stringValue")
                    expect(Defaults[.stringValue]).to(equal("Some string value"))
                }
            }
            
            context("integer value") {
                it("should be able to write to the defaults") {
                    Defaults[.integerValue] = 123
                    let integerValue = UserDefaults.standard.integer(forKey: "integerValue")
                    expect(integerValue).to(equal(123))
                }

                it("should be able to clear the defaults") {
                    Defaults[.integerValue] = 123
                    Defaults[.integerValue] = nil
                    let integerValue = UserDefaults.standard.integer(forKey: "integerValue")
                    expect(integerValue) == 0
                }
                
                it("should be able to read to the defaults") {
                    UserDefaults.standard.set(123, forKey: "integerValue")
                    expect(Defaults[.integerValue]).to(equal(123))
                }
            }
            
            context("float value") {
                it("should be able to write to the defaults") {
                    Defaults[.floatValue] = 123.123
                    let floatValue = UserDefaults.standard.float(forKey: "floatValue")
                    expect(floatValue).to(equal(123.123))
                }

                it("should be able to clear the defaults") {
                    Defaults[.floatValue] = 123.123
                    Defaults[.floatValue] = nil
                    let floatValue = UserDefaults.standard.float(forKey: "floatValue")
                    expect(floatValue) == 0
                }
                
                it("should be able to read to the defaults") {
                    UserDefaults.standard.set(123.123, forKey: "floatValue")
                    expect(Defaults[.floatValue]).to(equal(123.123))
                }
            }
            
            context("double value") {
                it("should be able to write to the defaults") {
                    Defaults[.doubleValue] = 123.123
                    let doubleValue = UserDefaults.standard.double(forKey: "doubleValue")
                    expect(doubleValue).to(equal(123.123))
                }

                it("should be able to clear the defaults") {
                    Defaults[.doubleValue] = 123.123
                    Defaults[.doubleValue] = nil
                    let doubleValue = UserDefaults.standard.double(forKey: "doubleValue")
                    expect(doubleValue) == 0
                }
                
                it("should be able to read to the defaults") {
                    UserDefaults.standard.set(123.123, forKey: "doubleValue")
                    expect(Defaults[.doubleValue]).to(equal(123.123))
                }
            }
            
            context("boolean value") {
                it("should be able to write to the defaults") {
                    Defaults[.booleanValue] = true
                    let booleanValue = UserDefaults.standard.bool(forKey: "booleanValue")
                    expect(booleanValue).to(beTrue())
                }
                
                it("should be able to read to the defaults") {
                    UserDefaults.standard.set(true, forKey: "booleanValue")
                    expect(Defaults[.booleanValue]).to(beTrue())
                }
            }
            
            context("date value") {
                it("should be able to write to the defaults") {
                    let date = Date(timeIntervalSince1970: 200)
                    Defaults[.dateValue] = date
                    // swiftlint:disable force_cast
                    let dateValue = UserDefaults.standard.object(forKey: "dateValue") as! Date
                    expect(dateValue).to(equal(date))
                }
                
                it("should be able to read to the defaults") {
                    let date = Date(timeIntervalSince1970: 100)
                    UserDefaults.standard.set(date, forKey: "dateValue")
                    expect(Defaults[.dateValue]).to(equal(date))
                }
            }
            
            context("string array value") {
                it("should be able to write to the defaults") {
                    let strings = ["string1", "string2", "string3"]
                    Defaults[.stringsValue] = strings
                    // swiftlint:disable force_cast
                    let stringArrayValue = UserDefaults.standard.object(forKey: "stringsValue") as! [String]
                    expect(stringArrayValue).to(equal(strings))
                }
                
                it("should be able to read from the defaults") {
                    let strings = ["string1", "string2", "string3"]
                    UserDefaults.standard.set(strings, forKey: "stringsValue")
                    expect(Defaults[.stringsValue]).to(equal(strings))
                }
            }
        }
        
    }
}
