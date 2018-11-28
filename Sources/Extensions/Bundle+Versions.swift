//
//  Bundle+Versions.swift
//  Keychain
//
//  Created by Jelle Vandebeeck on 11/02/2018.
//

import Foundation

extension Bundle {
    /// Return the `CFBundleShortVersionString` read from the Info.plist file in the current
    /// bundle.
    public var shortVersionString: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    /// Return the `CFBundleVersion` read from the Info.plist file in the current bundle.
    public var bundleVersion: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
