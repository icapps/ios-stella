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
                    let suffix = "error"
					expect(printError(suffix)).to(beginWith("🔥 \(suffix)"))
				}
			}

			context("action"){
				it("begins with 🎯"){
                    let action = "action"
					expect(printAction(action)).to(beginWith("🎯 \(action)"))
				}
			}

			context("breadCrumb") {
				it("begins with 🍞") {
                    let suffix = "breadCrumb"
					expect(printBreadcrumb(suffix)).to(beginWith("🍞 \(suffix)"))
				}
			}

			context("thought") {
				it("begins with 🤔") {
                    let suffix = "thought"
					expect(printThought(suffix)).to(beginWith("🤔 \(suffix)"))
				}
			}
		}

	}
}
