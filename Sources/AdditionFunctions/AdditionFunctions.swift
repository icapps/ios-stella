//
//  AdditionFunctions.swift
//  Pods
//
//  Created by Stijn Willems on 16/11/2016.
//
//

import Foundation

// MARK: - Additions without losing order

public extension Array where Element: Hashable {

    /// Will add object to array if it is not in the array. Without losing the order of the first elements.
    /// - parameter objects: will be added to array if it is not yet contained in array
    /// - returns: true if elements are added
    @discardableResult
    public mutating func addIfNeeded(_ elements: [Element]) -> Bool {
        var currentSet = Set<Element>(self)
        var objectsSet = Set<Element>(elements)
        objectsSet.subtract(currentSet)

        guard objectsSet.count > 0 else {
            return false
        }

        if objectsSet.count == elements.count {
            self.append(contentsOf: elements)
        } else {
            //What are the duplicates
            currentSet.subtract(objectsSet)
            // remove them from objects
            let arrayToAppend = elements.filter{!currentSet.contains($0)}
            // append the remaining array
            self.append(contentsOf: arrayToAppend)
        }
        
        return true
    }

    /// Will add object to array if it is not in the array. Without losing the order of the first elements.
    /// - parameter object: will be added to array if it is not yet contained in array
    /// - returns: true if element is added
    @discardableResult
    public mutating func addIfNeeded(_ element: Element) -> Bool {
        return addIfNeeded([element])
    }

}


