//
//  StringSizeCalculationSpec.swift
//  Stella
//
//  Created by Stijn Willems on 04/05/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation

import Quick
import Nimble

import Stella

class StringSizeCalculationSpec: QuickSpec {

	override func spec() {

		describe("String height when containt in a fixed width") {

			let string = "Donec ullamcorper nulla non metus auctor fringilla. Donec id elit non mi porta gravida at eget metus. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor."
			let smallerString = "Aenean lacinia bibendum nulla sed consectetur."
			let font = UIFont.systemFont(ofSize: 17)
			let width:CGFloat = 200

			it("Regular strings"){
				expect(string.height(constraintTo: width, font: font)).to(beCloseTo(304, within: 1))
				expect(smallerString.height(constraintTo: 200, font: font)).to(beCloseTo(40, within: 1))
			}

			it("Attributed strings"){
				let fontAttribute = [ NSFontAttributeName: UIFont.systemFont(ofSize: 17) ]

				let attributedString = NSAttributedString(string: string, attributes: fontAttribute)
				let smallerAttributedString = NSAttributedString(string: smallerString, attributes: fontAttribute)

				expect(attributedString.height(constraintTo: 200)).to(beCloseTo(304, within: 1))
				expect(smallerAttributedString.height(constraintTo: 200)).to(beCloseTo(40, within: 1))
			}

		}
	}

}
