//
//  Dispatch.swift
//  Pods
//
//  Created by Jelle Vandebeeck on 06/06/16.
//
//

import Foundation

public func printBreadcrumb(items: Any...) {
    print("🍞", items)
}

public func printError(items: Any...) {
    print("🔥", items)
}

public func printAction(items: Any...) {
    print("🎯", items)
}