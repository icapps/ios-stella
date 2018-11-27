//
//  OptionalsSpec.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 27/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import Stella

class OptionalsSpec: QuickSpec {
    override func spec() {
        describe("Optionals") {
            it("should have a optional init for an URL") {
                expect(URL(string: nil)).to(beNil())
                expect(URL(string: "https://icapps.com")).toNot(beNil())
            }
            
            it("should have a optional init for a UIImage") {
                expect(UIImage(data: nil)).to(beNil())
                
                let url = Bundle(for: OptionalsSpec.self).url(forResource: "Rocket", withExtension: "png")!
                let data = try? Data(contentsOf: url)
                expect(UIImage(data: data)).toNot(beNil())
            }
            
            it("should not set nil values on a dictionary") {
                var dictionary: [String: Int] = [:]
                dictionary["test"] = 123
                dictionary["other_test"] = nil
                
                expect(dictionary["test"]) == 123
                expect(dictionary["other_test"]).to(beNil())
                expect(dictionary.keys.count) == 1
            }
        }
    }
}
