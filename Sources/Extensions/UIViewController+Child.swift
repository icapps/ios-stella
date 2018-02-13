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
    public func add(childController controller: UIViewController, to view: UIView) {
        // Notify Child View Controller
        controller.willMove(toParentViewController: self)
        
        // Add Child View as Subview
        view.addSubview(controller.view)
        
        // Add Child View Controller
        addChildViewController(controller)
        
        // Configure Child View
        controller.view.constraintEdges(to: view)
        
        // Notify Child View Controller
        controller.didMove(toParentViewController: self)
    }
    
    /// Remove the given controller as a child from the current controller. It's view will
    /// also be removed as a subview.
    public func remove(childController controller: UIViewController) {
        // Notify Child View Controller
        controller.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        controller.viewIfLoaded?.removeFromSuperview()
        
        // Notify Child View Controller
        controller.removeFromParentViewController()
    }
    
}
