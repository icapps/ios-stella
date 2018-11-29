//
//  UIViewController+Storyboard.swift
//  iOSSnapshotTestCase
//
//  Created by Jelle Vandebeeck on 28/11/2018.
//

import UIKit

extension UIViewController {
    /// Load the controller from the storyboard.
    ///
    /// - parameter name: Storyboard name
    /// - parameter bundle: A custom bundle if needed, uses the main bundle by default.
    /// - parameter identifier: The identifier of the controller, when not set user the root controller.
    ///
    /// - returns: The typed controller when found.
    public static func from<Controller: UIViewController>(storyboard name: String,
                                                          bundle: Bundle = Bundle.main,
                                                          identifier: String? = nil) -> Controller? {
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        if let identifier = identifier {
            return storyboard.instantiateViewController(withIdentifier: identifier) as? Controller
        } else {
            return storyboard.instantiateInitialViewController() as? Controller
        }
    }
}
