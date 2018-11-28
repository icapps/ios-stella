//
//  Array+Safe.swift
//  Keychain
//
//  Created by Jelle Vandebeeck on 11/02/2018.
//

import Foundation

extension Array {
    /// Return an optional `Element` value when the given index is not available in this array.
    public subscript (safe index: Int) -> Element? {
        guard 0..<count ~= index else { return nil }
        return self[index]
    }
}
