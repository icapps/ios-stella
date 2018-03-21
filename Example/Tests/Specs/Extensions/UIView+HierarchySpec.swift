//
//  UIView+HierarchySpec.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 21/03/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import Stella

private class SomeView: UIView {
}

class UIViewHierarchySpec: QuickSpec {
    override func spec() {
        describe("UIView+Hierarchy") {
            var view: UIView!
            beforeEach {
                view = UIView()
            }

            it("should return the correct superview") {
                let superview = SomeView()
                superview.addSubview(view)

                expect(view.superview(of: SomeView.self)).toNot(beNil())
            }

            it("should return the correct nested superview") {
                let superview = UIView()
                superview.addSubview(view)
                let supersuperview = SomeView()
                supersuperview.addSubview(superview)
                expect(view.superview(of: SomeView.self)).toNot(beNil())
            }

            it("should return no superview") {
                let superview = UIView()
                superview.addSubview(view)
                expect(view.superview(of: SomeView.self)).to(beNil())
            }
        }
    }
}
