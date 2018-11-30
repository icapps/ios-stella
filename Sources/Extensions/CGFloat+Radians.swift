//
//  CGFloat+Radians.swift
//  iOSSnapshotTestCase
//
//  Created by Jelle Vandebeeck on 30/11/2018.
//

import CoreGraphics

extension CGFloat {
    /// Convert degrees to radians.
    public var degreesToRadians: CGFloat {
        return self * .pi / 180.0
    }

    /// Convert radians to degrees.
    public var radiansToDegrees: CGFloat {
        return self * 180.0 / .pi
    }
}
