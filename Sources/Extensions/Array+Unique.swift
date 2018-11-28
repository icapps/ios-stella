//
//  Array+Unique.swift
//  iOSSnapshotTestCase
//
//  Created by Jelle Vandebeeck on 28/11/2018.
//

import Foundation

extension Array where Element: Hashable {
    /// Return an array with unique elements. The duplicate elements are filtered out.
    public var unique: [Element] {
        var set: Set<Element> = []
        return reduce(into: []) { set.insert($1).inserted ? $0.append($1) : () }
    }
}
