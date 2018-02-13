//
//  UIViewController+ChildSpec.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 13/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import Stella

class UIViewControllerChildSpec: QuickSpec {

    override func spec() {
        describe("UIViewController+Child") {
            var parentController: UIViewController!

            beforeEach {
                parentController = UIViewController()
            }

            it("should have a child view controller") {
                let controller = UIViewController()
                parentController.add(controller: controller, to: parentController.view)

                expect(parentController.childViewControllers.count) == 1
                expect(parentController.view.subviews.count) == 1
            }

            it("should not have a child view controller after removal") {
                let controller = UIViewController()
                parentController.add(controller: controller, to: parentController.view)
                parentController.remove(controller: controller)

                expect(parentController.childViewControllers.count) == 0
                expect(parentController.view.subviews.count) == 0
            }
        }
    }

}
