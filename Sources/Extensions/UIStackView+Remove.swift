//
//  UIStackView+Remove.swift
//  iOSSnapshotTestCase
//
//  Created by Hannes Van den Berghe on 28/11/2018.
//

import UIKit

@available(iOS 9.0, *)
extension UIStackView {
    
    // MARK: - Remove
    
    /// Removes all the arranged subviews of the UIStackView
    public func removeAll() {
        arrangedSubviews.forEach { view in
            removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
}
