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

    /// Define the access group if you want to share the keychain values with other applications. When not set
    /// this value will be ignored, and no access group will be set.
    public var accessGroupName: String?

    public static let shared = KeychainHandler()
    
    fileprivate func data(for key: String, accessControl: SecAccessControl?) -> Data? {
        var query: [String: AnyObject] = [
            kSecClass as String      : kSecClassGenericPassword as NSString,
            kSecMatchLimit as String : kSecMatchLimitOne,
            kSecReturnData as String : kCFBooleanTrue,
            kSecAttrService as String: (Bundle.main.bundleIdentifier ?? "") as AnyObject,
            kSecAttrAccount as String: key as AnyObject
        ]
        if let accessControl = accessControl {
            query[kSecAttrAccessControl as String] = accessControl as AnyObject
        }
        if let accessGroupName = self.accessGroupName {
            query[kSecAttrAccessGroup as String] = accessGroupName as AnyObject
        }
        
        return self.secItemCopy(query).data as? Data
    }
    
    fileprivate func set(_ data: Data?, for key: String, accessControl: SecAccessControl?) -> Bool {
        var query: [String: AnyObject] = [
            kSecClass as String      : (kSecClassGenericPassword as NSString),
            kSecAttrAccount as String: key as AnyObject,
            kSecAttrService as String: (Bundle.main.bundleIdentifier ?? "") as AnyObject,
        ]
        if let accessControl = accessControl {
            query[kSecAttrAccessControl as String] = accessControl as AnyObject
        }
        if let accessGroupName = self.accessGroupName {
            query[kSecAttrAccessGroup as String] = accessGroupName as AnyObject
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
    fileprivate let accessControl: SecAccessControl?
    
    /// Initialize the key in your `Keys` extension.
    ///
    /// - parameter key: The key you want to use as the unique Keychain value.
    /// - parameter accessControl: The access control you want to use for the given key.
    ///
    /// ```
    /// static let string = Key<String?>("the string keychain key")
    /// ```
    public init(_ key: String, accessControl: SecAccessControl? = nil) {
        self.key = key
        self.accessControl = accessControl
    }
}

public extension KeychainHandler {
    
    /// Get the keychain String value for the given `DefaultsKey`. The preferred way to do this is to pass the static key variable defined in the `DefaultsKeys` extension.
    ///
    /// ```
    /// static let string = Key<String?>("the string defaults key")
    ///
    /// let accessControl = SecAccessControlCreateWithFlags(kCFAllocatorDefault,
    ///                                                     kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly,
    ///                                                     .userPresence, &error)
    /// static let noBackup = Key<String?>("not in backup", accessControl)
    /// ```
    public subscript(key: Key<String?>) -> String? {
        get {
            if let data = data(for: key.key, accessControl: key.accessControl) {
                return String(data: data, encoding: .utf8)
            }
            return nil
        }
        set {
            let value = newValue?.data(using: .utf8, allowLossyConversion: false)
            let _ = set(value, for: key.key, accessControl: key.accessControl)
        }
    }
}
