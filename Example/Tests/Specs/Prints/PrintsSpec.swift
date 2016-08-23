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

class PrintsSpec: QuickSpec {
    override func spec() {
        
        describe("print") {
            context("error") {
                it("begins with 🔥") {
					expect(printError("error")).to(beginWith("🔥"))
                }
            }

			context("action"){
				it("begins with 🎯"){
					expect(printAction("action")).to(beginWith("🎯"))
				}
			}

			context("breadCrumb") {
				it("begins with 🍞") {
					expect(printBreadcrumb("breadCrumb")).to(beginWith("🍞"))
				}
			}

			context("thought") {
				it("begins with 🤔") {
					expect(printThought("thought")).to(beginWith("🤔"))
				}
			}
        }
        
    }
}
