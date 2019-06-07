//
//  Localization.swift
//  Pods
//
//  Created by Jelle Vandebeeck on 06/06/16.
//
//

import Foundation

public extension String {
    /// Returns a localized string using the main bundle.
    var localizedString: String {
        return NSLocalizedString(self, comment: self)
    }
}
