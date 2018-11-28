//
//  URL+Optional.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 27/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

extension URL {
    /// Initializes and returns the URL object for the specified string.
    ///
    /// - parameter string: The url string, can be optional.
    public init?(string: String?) {
        guard let string = string else { return nil }
        self.init(string: string)
    }
}
