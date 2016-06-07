//
//  DispatchSpec.swift
//  Stella
//
//  Created by Jelle Vandebeeck on 07/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Stella

class DispatchSpec: QuickSpec {
    override func spec() {
        
        describe("dispatch handling") {
            it("should be performed on the main thread") {
                var onMainQueue = false
                dispatch_async_main {
                    let currentQueue = dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL)
                    let mainQueue = dispatch_queue_get_label(dispatch_get_main_queue())
                    onMainQueue = currentQueue == mainQueue
                }
                expect(onMainQueue).toEventually(beTrue(), timeout: 1)
            }
            
            it("should be performed on the main thread when comming from a background thread") {
                var onMainQueue = false
                var onBackgroundQueue = false
                
                let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
                dispatch_async(queue) {
                    let currentBackgroundQueue = dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL)
                    let backgroundQueue = dispatch_queue_get_label(queue)
                    onBackgroundQueue = currentBackgroundQueue == backgroundQueue
                    
                    dispatch_async_main {
                        let currentQueue = dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL)
                        let mainQueue = dispatch_queue_get_label(dispatch_get_main_queue())
                        onMainQueue = currentQueue == mainQueue
                    }
                }
                expect(onBackgroundQueue).toEventually(beTrue(), timeout: 1)
                expect(onMainQueue).toEventually(beTrue(), timeout: 1)
            }
        }
        
    }
}