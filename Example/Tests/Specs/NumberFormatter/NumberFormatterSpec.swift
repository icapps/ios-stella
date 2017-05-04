//
//  NumberFormatterSpec.swift
//  Stella
//
//  Created by Stijn Willems on 03/05/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation

import Quick
import Nimble

import Stella

class NumberFormatterSpec: QuickSpec {

	override func spec() {
		describe("Double rounding") {

			it("round to number of decimals") {
				StellaNumberFormatter.maximumFractionDigits = 4

				let double: Double = 22.56989123

				expect(double.roundedString) == "22.5699"

				StellaNumberFormatter.maximumFractionDigits = 2

				expect(double.roundedString) == "22.57"
			}

			it("round without decimal separator") {
				let double: Double = 22.56989123

				expect(double.roundedStringNoDecimals) == "23"
			}

		}
	}

}
