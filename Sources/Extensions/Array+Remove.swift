//
//  Array+Remove.swift
//  iOSSnapshotTestCase
//
//  Created by Jelle Vandebeeck on 28/11/2018.
//

import Foundation

extension Array where Element: Equatable {
    /// Remove the given element from an array. The result will be the removed index. When
    /// no element was found `nil` will be returned.
    ///
    /// - parameter element: The element to be removed.
    ///
    /// - returns: The deleted index
    @discardableResult
    public mutating func remove(_ element: Element) -> Int? {
        guard let index = firstIndex(of: element) else { return nil }
        remove(at: index)
        return index
    }
}
