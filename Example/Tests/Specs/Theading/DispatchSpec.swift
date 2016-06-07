//
//  DispatchSpec.swift
//  Stella
//
//  Created by Jelle Vandebeeck on 07/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble

class DispatchSpec: QuickSpec {
    override func spec() {
        
        describe("Dispatch handling") { 
            it("Should be performed on the main queue") {
                expect(true).to(equal(true))
            }
        }
        
    }
}