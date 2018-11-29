//
//  Array+Truncate.swift
//  iOSSnapshotTestCase
//
//  Created by Jelle Vandebeeck on 28/11/2018.
//

import Foundation

extension Array {
    /// Return an array with only the limited amount of elements.
    ///
    /// - parameter limit: The total number of items that should be returned.
    ///
    /// - returns: The truncated array.
    public func truncate(by limit: Int) -> Array {
        return Array(prefix(limit))
    }

    /// Return an array with only the limited amount of elements starting from the rear.
    ///
    /// - parameter limit: The total number of items that should be returned.
    ///
    /// - returns: The truncated array.
    public func reverseTruncate(by limit: Int) -> Array {
        return Array(suffix(limit))
    }
}
