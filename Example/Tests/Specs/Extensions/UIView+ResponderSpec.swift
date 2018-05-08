//
//  UIView+ResponderSpec.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 08/05/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import Stella

class UIViewResponderSpec: QuickSpec {
    override func spec() {
        describe("UIView+Responder") {
            it("should return the correct controller") {
                let controller = UIViewController()
                expect(controller.view.respondingController) == controller
            }

            it("should return the correct controller when subview") {
                let controller = UIViewController()
                let subview = UIView()
                controller.view.addSubview(subview)
                expect(subview.respondingController) == controller
            }

            it("should return the no controller") {
                let view = UIView(frame: .zero)
                expect(view.respondingController).to(beNil())
            }
        }
    }
}
