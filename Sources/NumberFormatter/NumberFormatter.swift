//
//  NumberFormatter.swift
//  Pods
//
//  Created by Stijn Willems on 03/05/2017.
//
//

import Foundation

// MARK: - Formatter

public struct StellaNumberFormatter {
	public static var minimumFractionDigits = 2 {
		didSet {
			StellaNumberFormatter.formatter.minimumFractionDigits = StellaNumberFormatter.minimumFractionDigits
		}
	}
	public static var maximumFractionDigits = 2 {
		didSet {
			StellaNumberFormatter.formatter.maximumFractionDigits = StellaNumberFormatter.maximumFractionDigits
		}
	}

	public static let formatter: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.groupingSeparator = " "
		formatter.numberStyle = .decimal
		formatter.minimumFractionDigits = StellaNumberFormatter.minimumFractionDigits
		formatter.maximumFractionDigits = StellaNumberFormatter.maximumFractionDigits
		return formatter
	}()

	public static let formatterNoDecimals: NumberFormatter = {
		let formatter = NumberFormatter()
		formatter.groupingSeparator = " "
		formatter.numberStyle = .decimal
		formatter.maximumFractionDigits = 0
		formatter.minimumFractionDigits = 0
		return formatter
	}()
}

// MARK: - Double extension

extension Double {

	public var roundedString: String {
		return StellaNumberFormatter.formatter.string(from: self as NSNumber) ?? ""
	}

	public var roundedStringNoDecimals: String {
		return StellaNumberFormatter.formatterNoDecimals.string(from: self as NSNumber) ?? ""
	}

}
