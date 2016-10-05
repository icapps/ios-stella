//
//  Keychain.swift
//  Pods
//
//  Created by Jelle Vandebeeck on 05/09/16.
//
//

/// `Keychain` is a wrapper for the Keychain shared instance.
public let Keychain = KeychainHandler.shared

/// The `KeychainHandler` class is responsible for the interaction with the keychain.
public class KeychainHandler {
    
    fileprivate static let shared = KeychainHandler()
    
}

/// `Keys` is a wrapper we can extend to define all the different keychain keys available.
///
/// ```
/// extension Keys {
///     static let string = Key<String?>("the string keychain key")
/// }
/// ```
open class Keys {}

/// The `Key` defines the key and the value type for a certain keychain value.
open class Key<ValueType>: Keys {
    fileprivate let key: String
    
    /// Initialize the key in your `Keys` extension.
    ///
    /// ```
    /// static let string = Key<String?>("the string keychain key")
    /// ```
    public init(_ key: String) {
        self.key = key
    }
}

public extension KeychainHandler {
    
    /// Get the defaults String value for the given `DefaultsKey`. The preferred way to do this is to pass the static key variable defined in the `DefaultsKeys` extension.
    ///
    /// ```
    /// static let string = Key<String?>("the string defaults key")
    /// ```
    public subscript(key: Key<String?>) -> String? {
        get {
            return nil
//            return string(forKey: key.key)
        }
        set {
//            set(newValue, forKey: key.key)
        }
    }
}
