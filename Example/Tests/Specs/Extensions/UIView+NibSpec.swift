//
//  UIView+NibSpec.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 12/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import Stella

class UIViewNibSpec: QuickSpec {
    
    // Mocked class is included in the spec because making it `private` outside of the spec
    // definition gives a weird result.
    class MockedView: UIView {
    }
    
    override func spec() {
        describe("UIView+Nib") {
            it("should containt the correct reuse identifier") {
                expect(MockedView.reuseIdentifier) == "MockedView"
            }
            
            it("should containt the correct nib name") {
                expect(MockedView.nibName) == "MockedView"
            }
            
            it("should containt the correct nib") {
                expect(MockedView.nib).toNot(beNil())
            }
        }
    }
    
}
