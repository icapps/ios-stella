//
//  UIView+Hierarchy.swift
//  FBSnapshotTestCase
//
//  Created by Jelle Vandebeeck on 21/03/2018.
//

import UIKit

extension UIView {
    /// Find the superview of the given type.
    ///
    /// - parameter type: The type of superview to find.
    /// - returns: The typed view if found.
    public func superview<T: UIView>(of type: T.Type) -> T? {
        return superview as? T ?? superview.flatMap { $0.superview(of: type) }
    }
}
