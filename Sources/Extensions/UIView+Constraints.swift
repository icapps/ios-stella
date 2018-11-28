//
//  UIView+Constraints.swift
//  Keychain
//
//  Created by Jelle Vandebeeck on 11/02/2018.
//

import UIKit

extension UIView {
    /// Constrain this view to the it's parent view.
    ///
    /// - parameter insets: The insets that give a some padding if needed.
    public func constrainToSuperview(insets: UIEdgeInsets = .zero) {
        // A superview should be set before setting constraints.
        guard let superview = superview else { return }
        constrain(to: superview, insets: insets)
    }
    
    /// Constrain this view to the given view.
    ///
    /// - parameter view: The view to constraint it's edges to.
    /// - parameter insets: The insets that give a some padding if needed.
    public func constrain(to view: UIView, insets: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor, constant: -insets.right).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom).isActive = true
        leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left).isActive = true
    }
    
    /// Constrain this view to the given view's safe areas.
    ///
    /// - parameter view: The view to constraint it's edges to.
    /// - parameter safeAreaInsets: The insets that give a some padding if needed.
    @available(iOS 11.0, *)
    public func constrain(to view: UIView, safeAreaInsets insets: UIEdgeInsets) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: insets.top).isActive = true
        rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -insets.right).isActive = true
        bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                                constant: -insets.bottom).isActive = true
        leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: insets.left).isActive = true
    }
    
    // MARK: - Deprecated
    
    /// Constrain this view to the given view.
    ///
    /// - parameter view: The view to constraint it's edges to.
    /// - parameter insets: The insets that give a some padding if needed.
    @available(*, deprecated, message: "Use constraint(to:insets) instead")
    public func constraintEdges(to view: UIView, insets: UIEdgeInsets = .zero) {
        constrain(to: view, insets: insets)
    }
}
