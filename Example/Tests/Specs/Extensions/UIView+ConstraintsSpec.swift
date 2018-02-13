//
//  UIView+ConstraintsSpec.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 13/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Stella

class UIViewConstraintsSpec: QuickSpec {

    override func spec() {
        describe("UIView+Constraints") {
            var view: UIView!

            beforeEach {
                view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
                view.backgroundColor = UIColor.red
            }

            it("should present a simple view") {
                expect(view) == snapshot()
            }

            it("should constraint a subview to the entire superview") {
                let subview = UIView(frame: .zero)
                subview.backgroundColor = UIColor.green
                view.addSubview(subview)
                subview.constraint(to: view)

                expect(view) == snapshot()
            }
        }
    }

}
