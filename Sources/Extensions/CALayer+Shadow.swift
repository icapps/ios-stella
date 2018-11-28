//
//  CALayer+Shadow.swift
//  iOSSnapshotTestCase
//
//  Created by Hannes Van den Berghe on 28/11/2018.
//

import UIKit

extension CALayer {
    
    // swiftlint:disable identifier_name
    public func applySketchShadow(color: UIColor = .black,
                                  alpha: Float = 0.1,
                                  x: CGFloat = 0,
                                  y: CGFloat = 2,
                                  blur: CGFloat = 15,
                                  spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
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
    
    public func removeSketchShadow() {
        shadowColor = nil
        shadowOpacity = 0
        shadowOffset = CGSize(width: 0, height: 0)
        shadowRadius = 0
        shadowPath = nil
    }
    
}
