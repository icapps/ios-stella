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

        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -insets.right),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left)
        ])
    }
    
    /// Constrain this view to the given view's safe areas.
    ///
    /// - parameter view: The view to constraint it's edges to.
    /// - parameter safeAreaInsets: The insets that give a some padding if needed.
    @available(iOS 11.0, tvOS 11.0, *)
    public func constrain(to view: UIView, safeAreaInsets insets: UIEdgeInsets) {
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: insets.top),
            trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -insets.right),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -insets.bottom),
            leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: insets.left)
        ])
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
