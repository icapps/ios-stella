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
                dispatch_on_main {
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
                    
                    dispatch_on_main {
                        let currentQueue = dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL)
                        let mainQueue = dispatch_queue_get_label(dispatch_get_main_queue())
                        onMainQueue = currentQueue == mainQueue
                    }
                }
                expect(onBackgroundQueue).toEventually(beTrue(), timeout: 1)
                expect(onMainQueue).toEventually(beTrue(), timeout: 1)
            }
            
            it("should be performed on the background thread") {
                var onBackgroundQueue = false
                dispatch_in_background {
                    let currentQueue = dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL)
                    let mainQueue = dispatch_queue_get_label(dispatch_get_main_queue())
                    onBackgroundQueue = currentQueue != mainQueue
                }
                expect(onBackgroundQueue).toEventually(beTrue(), timeout: 1)
            }
            
            it("should be dispatch on the main thread after 2 seconds") {
                var onMainQueue = false
                dispatch_on_main(after: 2) {
                    let currentQueue = dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL)
                    let mainQueue = dispatch_queue_get_label(dispatch_get_main_queue())
                    onMainQueue = currentQueue == mainQueue
                }
                expect(onMainQueue).toEventually(beFalse(), timeout: 1)
                expect(onMainQueue).toEventually(beTrue(), timeout: 2.1)
            }
            
            
            it("should be performed as a synchronous call") {
                var didComplete = false
                dispatch_wait { completion in
                    dispatch_in_background {
                        didComplete = true
                        completion()
                    }
                }
                expect(didComplete).to(beTrue())
            }
        }
        
    }
}