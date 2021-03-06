//
//  DefaultKeys.swift
//  Pods
//
//  Created by Jelle Vandebeeck on 08/06/16.
//
//

import Foundation

// swiftlint:disable identifier_name
/// `Defaults` is a wrapper for the UserDefaults standard defaults instance.
public let Defaults = UserDefaults.standard

/// `DefaultsKeys` is a wrapper we can extend to define all the different default keys available.
///
/// ```
/// extension DefaultsKeys {
///     static let string = DefaultsKey<String?>("the string defaults key")
/// }
/// ```
open class DefaultsKeys {}

/// The `DefaulesKey` defines the key and the value type for a certain user default value.
open class DefaultsKey<ValueType>: DefaultsKeys {
    fileprivate let key: String
    
    /// Initialize the key in your `DefaultsKeys` extension.
    ///
    /// ```
    /// static let string = DefaultsKey<String?>("the string defaults key")
    /// ```
    public init(_ key: String) {
        self.key = key
    }
}

public extension UserDefaults {
    /// Get the defaults dictionary value for the given `DefaultsKey`.
    /// The preferred way to do this is to pass the static
    ///
    /// key variable defined in the `DefaultsKeys` extension.
    ///
    /// ```
    /// static let dict = DefaultsKey<[String: Any]?>("the dict defaults key")
    /// ```
    subscript(key: DefaultsKey<[String: Any]?>) -> [String: Any]? {
        get {
            return dictionary(forKey: key.key)
        }
        set {
            set(newValue, forKey: key.key)
        }
    }
    
    /// Get the defaults Enum (type String) value for the given `DefaultsKey`. The preferred way to do this is to pass
    /// the static key variable defined in the `DefaultsKeys` extension.
    ///
    /// ```
    /// static let enumType = DefaultsKey<SomeEnumStringType?>("the enumType's defaults key")
    /// ```
    subscript<T: RawRepresentable>(key: DefaultsKey<T?>) -> T? where T.RawValue == String {
        get {
            guard let rawValue = string(forKey: key.key) else { return nil }
            return T(rawValue: rawValue)
        }
        set {
            set(newValue?.rawValue, forKey: key.key)
        }
    }
    
    /// Get the defaults Enum (type Int) value for the given `DefaultsKey`. The preferred way to do this is to pass
    /// the static key variable defined in the `DefaultsKeys` extension.
    ///
    /// ```
    /// static let enumType = DefaultsKey<SomeEnumIntType?>("the enumType's defaults key")
    /// ```
    subscript<T: RawRepresentable>(key: DefaultsKey<T?>) -> T? where T.RawValue == Int {
        get {
            return T(rawValue: integer(forKey: key.key))
        }
        set {
            set(newValue?.rawValue, forKey: key.key)
        }
    }
    
    /// Get the defaults String value for the given `DefaultsKey`. The preferred way to do this is to pass the static
    /// key variable defined in the `DefaultsKeys` extension.
    ///
    /// ```
    /// static let string = DefaultsKey<String?>("the string defaults key")
    /// ```
    subscript(key: DefaultsKey<String?>) -> String? {
        get {
            return string(forKey: key.key)
        }
        set {
            set(newValue, forKey: key.key)
        }
    }
    
    /// Get the defaults Int value for the given `DefaultsKey`. The preferred way to do this is to pass the static
    /// key variable defined in the `DefaultsKeys` extension.
    ///
    /// ```
    /// static let integer = DefaultsKey<Int?>("the integer defaults key")
    /// ```
    subscript(key: DefaultsKey<Int?>) -> Int? {
        get {
            return integer(forKey: key.key)
        }
        set {
            if let newValue = newValue {
                set(newValue, forKey: key.key)
            } else {
                removeObject(forKey: key.key)
            }
        }
    }
    
    /// Get the defaults Float value for the given `DefaultsKey`. The preferred way to do this is to pass the static
    /// key variable defined in the `DefaultsKeys` extension.
    ///
    /// ```
    /// static let float = DefaultsKey<Float?>("the float defaults key")
    /// ```
    subscript(key: DefaultsKey<Float?>) -> Float? {
        get {
            return float(forKey: key.key)
        }
        set {
            if let newValue = newValue {
                set(newValue, forKey: key.key)
            } else {
                removeObject(forKey: key.key)
            }
        }
    }
    
    /// Get the defaults Double value for the given `DefaultsKey`. The preferred way to do this is to pass the static
    /// key variable defined in the `DefaultsKeys` extension.
    ///
    /// ```
    /// static let double = DefaultsKey<Double?>("the double defaults key")
    /// ```
    subscript(key: DefaultsKey<Double?>) -> Double? {
        get {
            return double(forKey: key.key)
        }
        set {
            if let newValue = newValue {
                set(newValue, forKey: key.key)
            } else {
                removeObject(forKey: key.key)
            }
        }
    }
    
    /// Get the defaults Bool value for the given `DefaultsKey`. The preferred way to do this is to pass the static
    /// key variable defined in the `DefaultsKeys` extension.
    ///
    /// ```
    /// static let boolean = DefaultsKey<Bool?>("the boolean defaults key")
    /// ```
    subscript(key: DefaultsKey<Bool?>) -> Bool {
        get {
            return bool(forKey: key.key)
        }
        set {
            set(newValue, forKey: key.key)
        }
    }
    
    /// Get the defaults NSDate value for the given `DefaultsKey`. The preferred way to do this is to pass the static
    /// key variable defined in the `DefaultsKeys` extension.
    ///
    /// ```
    /// static let date = DefaultsKey<NSDate?>("the date defaults key")
    /// ```
    subscript(key: DefaultsKey<Date?>) -> Date? {
        get {
            return object(forKey: key.key) as? Date
        }
        set {
            set(newValue, forKey: key.key)
        }
    }
    
    /// Get the defaults [String] value for the given `DefaultsKey`. The preferred way to do this is to pass the static
    /// key variable defined in the `DefaultsKeys` extension.
    ///
    /// ```
    /// static let strings = DefaultsKey<[String]?>("the strings defaults key")
    /// ```
    subscript(key: DefaultsKey<[String]?>) -> [String]? {
        get {
            return object(forKey: key.key) as? [String]
        }
        set {
            set(newValue, forKey: key.key)
        }
    }
}
