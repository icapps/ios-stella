//
//  UIViewController+TopMostSpec.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 10/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Stella

private class MockedViewController: UIViewController {
    var mockedPresentedViewController: UIViewController?
    override var presentedViewController: UIViewController? {
        return mockedPresentedViewController
    }
}

class UIViewControllerTopMostSpec: QuickSpec {
    override func spec() {
        describe("UIViewController+TopMost") {
            var controller: UIViewController!
            beforeEach {
                controller = UIViewController()
            }

            it("should be self") {
                expect(controller.topMostViewController) == controller
            }

            it("should be the presented controller") {
                let controller = MockedViewController()
                controller.mockedPresentedViewController = UIViewController()
                expect(controller.topMostViewController).toEventually(be(controller.mockedPresentedViewController))
            }

            it("should be the presented controller in the navigation controller") {
                _ = UINavigationController(rootViewController: controller)
                expect(controller.topMostViewController) == controller
            }

            it("should be the presented controller in the tab bar controller") {
                let tabBarController = UITabBarController()
                tabBarController.setViewControllers([controller], animated: false)
                expect(controller.topMostViewController) == controller
            }

            it("should be the navigation controller") {
                let navigationController = UINavigationController()
                expect(navigationController.topMostViewController) == navigationController
            }

            it("should be the visible view controller in the navigation controller") {
                let navigationController = UINavigationController(rootViewController: controller)
                expect(navigationController.topMostViewController) == controller
            }

            it("should be the tab bar controller") {
                let tabBarController = UITabBarController()
                expect(tabBarController.topMostViewController) == tabBarController
            }

            it("should be the selected view controller in the tab bar controller") {
                let tabBarController = UITabBarController()
                tabBarController.setViewControllers([controller], animated: false)
                expect(tabBarController.topMostViewController) == controller
            }
        }
    }
}
