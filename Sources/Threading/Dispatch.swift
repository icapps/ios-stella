//
//  Dispatch.swift
//  Pods
//
//  Created by Jelle Vandebeeck on 06/06/16.
//
//

import Foundation

public func dispatch_async_main(block: dispatch_block_t) {
    dispatch_async(dispatch_get_main_queue()) { 
        block()
    }
}