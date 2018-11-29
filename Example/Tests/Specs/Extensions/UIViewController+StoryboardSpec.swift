//
//  UIViewController+Storyboard.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 28/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import Stella

class UIViewControllerStoryboardSpec: QuickSpec {
    override func spec() {
        describe("UIViewController+Storyboard") {
            it("should return the typed controller from the storyboard") {
                let bundle = Bundle(for: UIViewControllerStoryboardSpec.self)
                let controller = FirstViewController.from(storyboard: "Controllers", bundle: bundle)
                expect(controller).to(beAKindOf(FirstViewController.self))
            }

            it("should return the typed controller from the storyboard with a custom identifier") {
                let bundle = Bundle(for: UIViewControllerStoryboardSpec.self)
                let controller = SecondViewController.from(storyboard: "Controllers",
                                                           bundle: bundle,
                                                           identifier: "Second")
                expect(controller).to(beAKindOf(SecondViewController.self))
            }
        }
    }
}
