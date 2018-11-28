//
//  UIViewController+ChildSpec.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 13/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Stella

class UIViewControllerChildSpec: QuickSpec {
    override func spec() {
        describe("UIViewController+Child") {
            var parentController: UIViewController!
            var controller: UIViewController!
            beforeEach {
                parentController = UIViewController()
                parentController.view.backgroundColor = .red
                
                controller = UIViewController()
                controller.view.backgroundColor = .green
            }

            it("should have a child view controller") {
                parentController.add(controller, to: parentController.view)

                expect(parentController.children.count) == 1
                expect(parentController.view.subviews.count) == 1
                expect(parentController.view) == snapshot()
            }
            
            it("should constraint the view to the parent controller's view") {
                let insets: UIEdgeInsets = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 30.0, right: 40.0)
                parentController.add(controller, to: parentController.view, insets: insets)
                
                expect(parentController.children.count) == 1
                expect(parentController.view.subviews.count) == 1
                expect(parentController.view) == snapshot()
            }
            
            it("should constraint the view to the parent controller's view with safe areao") {
                let insets: UIEdgeInsets = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 30.0, right: 40.0)
                parentController.add(controller, to: parentController.view, safeAreaInsets: insets)
                
                expect(parentController.children.count) == 1
                expect(parentController.view.subviews.count) == 1
                expect(parentController.view) == snapshot()
            }

            it("should not have a child view controller after removal") {
                parentController.add(controller, to: parentController.view)
                parentController.remove(controller)

                expect(parentController.children.count) == 0
                expect(parentController.view.subviews.count) == 0
                expect(parentController.view) == snapshot()
            }
        }
    }

}
