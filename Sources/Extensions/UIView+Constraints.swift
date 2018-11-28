//
//  UIView+Constraints.swift
//  Keychain
//
//  Created by Jelle Vandebeeck on 11/02/2018.
//

import UIKit

extension UIView {
    /// Constrain this view to the given view.
    ///
    /// - parameter view: The view to constraint it's edges to.
    public func constraintEdges(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
