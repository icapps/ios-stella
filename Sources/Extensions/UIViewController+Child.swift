//
//  UIViewController+Child.swift
//  Keychain
//
//  Created by Jelle Vandebeeck on 11/02/2018.
//

import UIKit

extension UIViewController {
    /// Add a given controller to the current controller as a child view controller. The given
    /// controller's view is added as a subview to the given `UIView`.
    ///
    /// - parameter controller: The controller to add to the current controller as a child.
    /// - parameter to: The container view in which to add the child controller's view.
    /// - parameter insets: The insets that give a some padding inside the container if needed.
    public func add(_ controller: UIViewController, to view: UIView, insets: UIEdgeInsets = .zero) {
        // Add Child View Controller
        addChild(controller)
        // Add Child View as Subview
        view.addSubview(controller.view)
        // Configure Child View inside the container view.
        controller.view.constrain(to: view, insets: insets)
        // Notify Child View Controller
        controller.didMove(toParent: self)
    }
    
    /// Add a given controller to the current controller as a child view controller. The given
    /// controller's view is added as a subview to the given `UIView`.
    ///
    /// - parameter controller: The controller to add to the current controller as a child.
    /// - parameter to: The container view in which to add the child controller's view.
    /// - parameter safeAreaInsets: The insets that give a some padding inside the container's safe area.
    @available(iOS 11.0, tvOS 11.0, *)
    public func add(_ controller: UIViewController, to view: UIView, safeAreaInsets insets: UIEdgeInsets) {
        // Add Child View Controller
        addChild(controller)
        // Add Child View as Subview
        view.addSubview(controller.view)
        // Configure Child View inside the container view.
        controller.view.constrain(to: view, safeAreaInsets: insets)
        // Notify Child View Controller
        controller.didMove(toParent: self)
    }
    
    /// Remove the given controller as a child from the current controller. It's view will
    /// also be removed as a subview.
    ///
    /// - parameter controller: The child controller to remove from the parent.
    public func remove(_ controller: UIViewController) {
        // Notify Child View Controller
        controller.willMove(toParent: nil)
        // Remove Child View From Superview
        controller.viewIfLoaded?.removeFromSuperview()
        // Notify Child View Controller
        controller.removeFromParent()
    }

    // MARK: - Deprecated

    /// Add a given controller to the current controller as a child view controller. The given
    /// controller's view is added as a subview to the given `UIView`.
    ///
    /// - parameter childController: The controller to add to the current controller as a child.
    /// - parameter to: The container view in which to add the child controller's view.
    /// - parameter insets: The insets that give a some padding inside the container if needed.
    @available(*, deprecated, message: "Use add(_:to:insets:) instead")
    public func add(childController controller: UIViewController, to view: UIView, insets: UIEdgeInsets = .zero) {
        add(controller, to: view, insets: insets)
    }

    /// Remove the given controller as a child from the current controller. It's view will
    /// also be removed as a subview.
    ///
    /// - parameter childController: The child controller to remove from the parent.
    @available(*, deprecated, message: "Use renove(_) instead")
    public func remove(childController controller: UIViewController) {
        remove(controller)
    }
}
