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
            
            context("subview") {
                var subview: UIView!
                beforeEach {
                    subview = UIView(frame: .zero)
                    subview.backgroundColor = UIColor.green
                    view.addSubview(subview)
                }
                
                it("should constraint a subview to the entire given view") {
                    subview.constraint(to: view)
                    expect(view) == snapshot()
                }
                
                it("should constraint a subview to the given view with the given edge insets") {
                    let insets: UIEdgeInsets = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 30.0, right: 40.0)
                    subview.constraint(to: view, insets: insets)
                    expect(view) == snapshot()
                }
                
                it("should constraint a subview to the given view's safe area with the given edge insets") {
                    let insets: UIEdgeInsets = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 30.0, right: 40.0)
                    subview.constraint(to: view, safeAreaInsets: insets)
                    expect(view) == snapshot()
                }
                
                it("should constraint a subview to it's superview") {
                    subview.constraintToSuperview()
                    expect(view) == snapshot()
                }
                
                it("should constraint a subview to it's superview with the given edge insets") {
                    let insets: UIEdgeInsets = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 30.0, right: 40.0)
                    subview.constraintToSuperview(insets: insets)
                    expect(view) == snapshot()
                }
            }
        }
    }
}
