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
}

class DefaultsSpec: QuickSpec {
    override func spec() {
        
        describe("defaults") {
            context("string value") {
                it("should be able to write to the defaults") {
                    Defaults[.stringValue] = "A string value"
                    let stringValue = NSUserDefaults.standardUserDefaults().stringForKey("stringValue")
                    expect(stringValue).to(equal("A string value"))
                }
                
                it("should be able to read to the defaults") {
                    NSUserDefaults.standardUserDefaults().setObject("Some string value", forKey: "stringValue")
                    expect(Defaults[.stringValue]).to(equal("Some string value"))
                }
            }
        }
        
    }
}
