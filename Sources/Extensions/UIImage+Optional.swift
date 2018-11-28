//
//  UIImage+Optional.swift
//  iOSSnapshotTestCase
//
//  Created by Jelle Vandebeeck on 27/11/2018.
//

import UIKit

extension UIImage {
    /// Initializes and returns the image object with the specified data.
    ///
    /// - parameter data: Data that contains the image, can be optional.
    public convenience init?(data: Data?) {
        guard let data = data else { return nil }
        self.init(data: data)
    }
}
