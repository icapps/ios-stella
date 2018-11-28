//
//  CALayer+Shadow.swift
//  iOSSnapshotTestCase
//
//  Created by Hannes Van den Berghe on 28/11/2018.
//

import UIKit

extension CALayer {
    /// Adding shadow to a layer based on parameters `Sketch` parameters
    ///
    ///
    /// - parameter color: The color the shadow should be.
    /// - parameter opacity: The opacity the shadow should have.
    /// - parameter x: The x-point which the offset should start.
    /// - parameter y: The y-point which the offset should start
    /// - parameter blur: The the blur the shadow should have
    /// - parameter spread: The spread the shadow should have
    //
    /// Example: `view.layer.applyShadow()
    ///
    // swiftlint:disable identifier_name
    public func applyShadow(color: UIColor = .black,
                            opacity: Float = 0.1,
                            x: CGFloat = 0,
                            y: CGFloat = 2,
                            blur: CGFloat = 15,
                            spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = opacity
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
    
    /// Removing the shadow of a layer
    public func removeShadow() {
        shadowColor = nil
        shadowOpacity = 0
        shadowOffset = CGSize(width: 0, height: 0)
        shadowRadius = 0
        shadowPath = nil
    }
}
