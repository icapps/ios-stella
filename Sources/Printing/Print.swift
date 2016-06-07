//
//  Dispatch.swift
//  Pods
//
//  Created by Jelle Vandebeeck on 06/06/16.
//
//

/**
 Writes the textual representations of items, prefixed with a 🍞 emoji, into the standard output.
 
 This function is used to print breadcrumbs.
 
 - Parameter items: The items to write to the output.
 */
public func printBreadcrumb(items: Any...) {
    print("🍞", items)
}

/**
 Writes the textual representations of items, prefixed with a 🔥 emoji, into the standard output.
 
 This function is used to print errors.
 
 - Parameter items: The items to write to the output.
 */
public func printError(items: Any...) {
    print("🔥", items)
}

/**
 Writes the textual representations of items, prefixed with a 🎯 emoji, into the standard output.
 
 This function is used to print user actions.
 
 - Parameter items: The items to write to the output.
 */
public func printAction(items: Any...) {
    print("🎯", items)
}