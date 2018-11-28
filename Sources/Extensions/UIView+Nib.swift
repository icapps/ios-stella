//
//  UIView+Nib.swift
//  Keychain
//
//  Created by Jelle Vandebeeck on 11/02/2018.
//

import UIKit

extension UIView {
    /// Return the name of the view's class as it's reuse identifier.
    public class var reuseIdentifier: String {
        return String(describing: self)
    }
    
    /// Return the name of the view's class as it's nib name.
    public class var nibName: String {
        return String(describing: self)
    }
    
    /// Return the nib matching the class name of the view.
    public class var nib: UINib {
        return UINib(nibName: nibName, bundle: Bundle(for: self))
    }

    /// Load the custom view from the nib with the same name in the same bundle.
    ///
    /// In order to use this function, make sure that you already types the destination variable:
    /// ex: `let view: SomeView = UIView.loadFromNib()`
    public class func loadFromNib<View: UIView>() -> View {
        let views = View.nib.instantiate(withOwner: nil, options: nil)
        // swiftlint:disable force_cast
        return views.first as! View
    }
}
