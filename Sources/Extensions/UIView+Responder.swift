//
//  UIView+Responder.swift
//  FBSnapshotTestCase
//
//  Created by Jelle Vandebeeck on 08/05/2018.
//

import UIKit

extension UIView {
    /// Return the controller that is responsible for managing this view.
    public var respondingController: UIViewController? {
        if let controller = next as? UIViewController { return controller }
        if let view = next as? UIView { return view.respondingController }
        return nil
    }
}
