//
//  AppInfo.swift
//  Stella
//
//  Created by Hannes Van den Berghe on 13/06/2018.
//

import Foundation

/// `MainBundle` is a wrapper for the Bundles main instance.
public let MainBundle = Bundle.main

/// `AppInfoKeys` is a wrapper we can extend to define all the different keys available
///
/// ```
/// extension AppInfoKeys {
///     static let string = AppInfoKey<String?>("the key")
/// }
/// ```
open class AppInfoKeys { }

/// The `AppInfoKey` defines the kay and the value type for a certain value
open class AppInfoKey<ValueType>: AppInfoKeys {
    fileprivate let key: String

    /// Initialize the key in your `AppInfoKeys` extension.
    ///
    /// ```
    /// static let string = AppInfoKey<String?>("the key")
    /// ```
    public init(_ key: String) {
        self.key = key
    }
}

public extension Bundle {

    /// Get the String value for the given `AppInfoKey`. The preferred way to do this is to pass the static key variable defined in the `AppInfoKeys` extension.
    ///
    /// ```
    /// static let value = AppInfoKey<String?>("the key")
    /// ```
    public subscript(key: AppInfoKey<String?>) -> String? {
        get {
            guard let value = MainBundle.infoDictionary?[key.key] as? String else {
                return nil
            }
            return value
        }
    }

    /// Get the Int value for the given `AppInfoKey`. The preferred way to do this is to pass the static key variable defined in the `AppInfoKeys` extension.
    ///
    /// ```
    /// static let value = AppInfoKey<Int?>("the key")
    /// ```
    public subscript(key: AppInfoKey<Int?>) -> Int? {
        get {
            guard let value = MainBundle.infoDictionary?[key.key] as? Int else {
                return nil
            }
            return value
        }
    }

    /// Get the Bool value for the given `AppInfoKey`. The preferred way to do this is to pass the static key variable defined in the `AppInfoKeys` extension.
    ///
    /// ```
    /// static let value = AppInfoKey<Bool?>("the key")
    /// ```
    public subscript(key: AppInfoKey<Bool?>) -> Bool? {
        get {
            guard let value = MainBundle.infoDictionary?[key.key] as? Bool else {
                return nil
            }
            return value
        }
    }
}
