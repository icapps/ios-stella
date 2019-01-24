//
//  UIViewController+TopMost.swift
//  Keychain
//
//  Created by Jelle Vandebeeck on 10/12/2018.
//

import UIKit

extension UIViewController {
    /// Get the view controller that is currently on top in your application.
    ///
    /// Could be usefull when you want to present an alert on top.
    ///
    /// ex.
    /// ```swift
    /// let controller = UIAlertController(...)
    /// topMostViewController?.present(controller, animated: false, completion: nil)
    /// ```
    ///
    /// - returns: The view controller on top.
    public var topMostViewController: UIViewController {
        if let presentedViewController = presentedViewController {
            return presentedViewController.topMostViewController
        } else if let navigationController = self as? UINavigationController {
            return navigationController.visibleViewController?.topMostViewController ?? navigationController
        } else if let tabBarController = self as? UITabBarController {
            return tabBarController.selectedViewController?.topMostViewController ?? tabBarController
        } else {
            return self
        }
    }
}
