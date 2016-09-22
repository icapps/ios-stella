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

// Define the keys used for this test.
extension DefaultsKeys {
    static let stringValue = DefaultsKey<String?>("stringValue")
    static let integerValue = DefaultsKey<Int?>("integerValue")
    static let doubleValue = DefaultsKey<Double?>("doubleValue")
    static let floatValue = DefaultsKey<Float?>("floatValue")
    static let booleanValue = DefaultsKey<Bool?>("booleanValue")
    static let dateValue = DefaultsKey<Date?>("dateValue")
}

class DefaultsSpec: QuickSpec {
    override func spec() {
        
        describe("defaults") {
            context("string value") {
                it("should be able to write to the defaults") {
                    Defaults[.stringValue] = "A string value"
                    let stringValue = UserDefaults.standard.string(forKey: "stringValue")
                    expect(stringValue).to(equal("A string value"))
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
                    let dateValue = UserDefaults.standard.object(forKey: "dateValue") as! Date
                    expect(dateValue).to(equal(date))
                }
                
                it("should be able to read to the defaults") {
                    let date = Date(timeIntervalSince1970: 100)
                    UserDefaults.standard.set(date, forKey: "dateValue")
                    expect(Defaults[.dateValue]).to(equal(date))
                }
            }
        }
        
    }
}
