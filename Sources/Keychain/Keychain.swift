//
//  Keychain.swift
//  Pods
//
//  Created by Jelle Vandebeeck on 05/09/16.
//
//

import Foundation

// swiftlint:disable identifier_name
/// `Keychain` is a wrapper for the Keychain shared instance.
public let Keychain = KeychainHandler.shared

/// The `KeychainHandler` class is responsible for the interaction with the keychain.
public class KeychainHandler {
    /// Define the access group if you want to share the keychain values with other applications. When not set
    /// this value will be ignored, and no access group will be set.
    public var accessGroupName: String?
    
    public var bundleIdentifier: String?

    public static let shared = KeychainHandler()
    
    fileprivate func data(for key: String, additionalQuery: [String: AnyObject]?) -> Data? {
        var query: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword as NSString,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: kCFBooleanTrue,
            kSecAttrService as String: (bundleIdentifier ?? Bundle.main.bundleIdentifier ?? "") as AnyObject,
            kSecAttrAccount as String: key as AnyObject
        ]
        if let accessGroupName = self.accessGroupName {
            query[kSecAttrAccessGroup as String] = accessGroupName as AnyObject
        }
        // Set additional query values when given.
        if let additionalQuery = additionalQuery {
            additionalQuery.forEach { key, value in query[key] = value }
        }
        return self.secItemCopy(query).data as? Data
    }
    
    fileprivate func set(_ data: Data?, for key: String, additionalQuery: [String: AnyObject]?) -> Bool {
        var query: [String: AnyObject] = [
            kSecClass as String: (kSecClassGenericPassword as NSString),
            kSecAttrAccount as String: key as AnyObject,
            kSecAttrService as String: (bundleIdentifier ?? Bundle.main.bundleIdentifier ?? "") as AnyObject
        ]
        if let accessGroupName = self.accessGroupName {
            query[kSecAttrAccessGroup as String] = accessGroupName as AnyObject
        }
        // Set additional query values when given.
        if let additionalQuery = additionalQuery {
            additionalQuery.forEach { key, value in query[key] = value }
        }
        if let data = data {
            query[kSecValueData as String] = data as AnyObject
            return self.secItemAdd(query) == noErr
        } else {
            return self.secItemDelete(query) == noErr
        }
    }
    
    private func secItemCopy(_ query: [String: AnyObject]) -> (status: OSStatus, data: AnyObject?) {
        var result: AnyObject?
        let status: OSStatus = withUnsafeMutablePointer(to: &result) {
            SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer($0))
        }
        return (status, result)
    }
    
    private func secItemAdd(_ attributes: [String: AnyObject]) -> OSStatus {
        _ = self.secItemDelete(attributes)
        return SecItemAdd(attributes as CFDictionary, nil)
    }
    
    private func secItemUpdate(_ query: [String: AnyObject], attributes: [String: AnyObject]) -> OSStatus {
        return SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
    }
    
    private func secItemDelete(_ query: [String: AnyObject]) -> OSStatus {
        return SecItemDelete(query as CFDictionary)
    }
    
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
    fileprivate let additionalQuery: [String: AnyObject]?
    
    /// Initialize the key in your `Keys` extension.
    ///
    /// - parameter key: The key you want to use as the unique Keychain value.
    /// - parameter additionalQuery: Additional query parameters you want to pass.
    ///
    /// ```
    /// static let string = Key<String?>("the string keychain key")
    /// ```
    public init(_ key: String, additionalQuery: [String: AnyObject]? = nil) {
        self.key = key
        self.additionalQuery = additionalQuery
    }
}

public extension KeychainHandler {
    /// Get the keychain String value for the given `DefaultsKey`. The preferred way to do this is to pass the static
    /// key variable defined in the `DefaultsKeys` extension.
    ///
    /// ```
    /// static let string = Key<String?>("the string defaults key")
    ///
    /// let accessControl = SecAccessControlCreateWithFlags(kCFAllocatorDefault,
    ///                                                     kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly,
    ///                                                     .userPresence, &error)
    /// static let noBackup = Key<String?>("not in backup", accessControl)
    /// ```
    subscript(key: Key<String?>) -> String? {
        get {
            if let data = data(for: key.key, additionalQuery: key.additionalQuery) {
                return String(data: data, encoding: .utf8)
            }
            return nil
        }
        set {
            let value = newValue?.data(using: .utf8, allowLossyConversion: false)
            _ = set(value, for: key.key, additionalQuery: key.additionalQuery)
        }
    }
}
