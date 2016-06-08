//
//  DefaultKeys.swift
//  Pods
//
//  Created by Jelle Vandebeeck on 08/06/16.
//
//

/// `Defaults` is a wrapper for the NSUserDefaults standard defaults instance.
public let Defaults = NSUserDefaults.standardUserDefaults()

/// `DefaultsKeys` is a wrapper we can extend to define all the different default keys available.
///
/// ```
/// extension DefaultsKeys {
///     static let string = DefaultsKey<String?>("the string defaults key")
/// }
/// ```
public class DefaultsKeys {}

/// The `DefaulesKey` defines the key and the value type for a certain user default value.
public class DefaultsKey<ValueType>: DefaultsKeys {
    private let key: String
    
    /// Initialize the key in your `DefaultsKeys` extension.
    ///
    /// ```
    /// static let string = DefaultsKey<String?>("the string defaults key")
    /// ```
    public init(_ key: String) {
        self.key = key
    }
}

public extension NSUserDefaults {
    
    /// Get the defaults value for the given `DefaultsKey`. The preferred way to do this is to pass the static key variable defined in the `DefaultsKeys` extension.
    ///
    /// ```
    /// static let string = DefaultsKey<String?>("the string defaults key")
    /// ```
    public subscript(key: DefaultsKey<String?>) -> String? {
        get {
            return stringForKey(key.key)
        }
        set {
            setObject(newValue, forKey: key.key)
        }
    }
}