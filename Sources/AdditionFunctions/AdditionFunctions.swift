//
//  AdditionFunctions.swift
//  Pods
//
//  Created by Stijn Willems on 16/11/2016.
//
//

import Foundation

// MARK: - Additions without losing order

/// Will add object to array if it is not in the array. Without losing the order of the first elements.
/// - parameter array: array to add object to
/// - parameter object: will be added to array if it is not yet contained in array
/// - returns: array with added object if it was not already in the array
public func addIfNeeded<A: Hashable>(to array:[A], from object: A) -> [A] {
    return addIfNeeded(to: array, from: [object])
}

/// Will add object to array if it is not in the array. Without losing the order of the first elements.
/// - parameter array: array to add object to
/// - parameter objects: will be added to array if it is not yet contained in array
/// - returns: array with added object if it was not already in the array
public func addIfNeeded<A: Hashable>(to array:[A], from objects: [A]) -> [A] {
    var currentSet = Set<A>(array)
    var objectsSet = Set<A>(objects)
    var array = array
    objectsSet.subtract(currentSet)

    guard objectsSet.count > 0 else {
        return array
    }

    if objectsSet.count == objects.count {
        array.append(contentsOf: objects)
    } else {
        //What are the duplicates
        currentSet.subtract(objectsSet)
        // remove them from objects
        let arrayToAppend = objects.filter{!currentSet.contains($0)}
        // append the remaining array
        array.append(contentsOf: arrayToAppend)
    }

    return array
}
