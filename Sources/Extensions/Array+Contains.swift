//
//  Array+Contains.swift
//  iOSSnapshotTestCase
//
//  Created by Jelle Vandebeeck on 28/11/2018.
//

import Foundation

extension Array where Element: Equatable {
    /// Checks if the given element is included in the current array.
    ///
    /// - parameter element: The element to lookup.
    ///
    /// - returns: If the given element is included.
    public func contains(_ element: Element?) -> Bool {
        return first(where: { $0 == element }) != nil
    }
}
