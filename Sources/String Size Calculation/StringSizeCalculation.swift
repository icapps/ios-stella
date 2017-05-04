//
//  StringSizeCalculation.swift
//  Pods
//
//  Created by Stijn Willems on 04/05/2017.
//
//

import Foundation

extension String {

	public func height(constraintTo width: CGFloat, font: UIFont) -> CGFloat {
		let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
		let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)

		return boundingBox.height
	}

}

extension NSAttributedString {

	public func height(constraintTo width: CGFloat) -> CGFloat {
		let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
		let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)

		return boundingBox.height
	}

	public func width(constraintTo height: CGFloat) -> CGFloat {
		let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
		let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)

		return boundingBox.width
	}
}
