//
//  Dispatch.swift
//  Pods
//
//  Created by Jelle Vandebeeck on 06/06/16.
//
//

/**
 Submits a block for asynchronous execution on the main dispatch queue.
 
 - Parameter block: The block to submit to the target dispatch queue.
 */
public func dispatch_on_main(block: dispatch_block_t) {
    dispatch_async(dispatch_get_main_queue()) { 
        block()
    }
}

/**
 Submits a block for asynchronous execution on a background dispatch queue.
 
 - Parameter block: The block to submit to the target dispatch queue.
 */
public func dispatch_in_background(block: dispatch_block_t) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
        block()
    }
}

/**
 Submits a block for asynchronous execution on the main dispatch queue after a delay.
 
 - Parameter seconds: The delay before the block is executed expressed in seconds.
 - Parameter block: The block to submit to the target dispatch queue.
 */
public func dispatch_on_main_after(seconds: UInt64, block: dispatch_block_t) {
    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * NSEC_PER_SEC))
    dispatch_after(delayTime, dispatch_get_main_queue()) {
        block()
    }
}