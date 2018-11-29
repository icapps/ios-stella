//
//  UIStackView+RemoveAllSpec.swift
//  Tests
//
//  Created by Hannes Van den Berghe on 28/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Stella
import Nimble_Snapshots

class UIStackViewRemoveAllSpec: QuickSpec {
    
    override func spec() {
        
        describe("UIStackView") {
            var view: UIView!
            var stackView: UIStackView!
            let frame = CGRect(x: 0, y: 0, width: 250, height: 100)
            
            func add(colors: [UIColor]) {
                for color in colors {
                    let view = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 100))
                    view.backgroundColor = color
                    stackView.addArrangedSubview(view)
                }
            }
            
            beforeEach {
                view = UIView(frame: frame)
                stackView = UIStackView(frame: frame)
                stackView.axis = .horizontal
                stackView.distribution = .fillEqually
                
                view.addSubview(stackView)
                stackView.constrain(to: view, safeAreaInsets: UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0))
                view.backgroundColor = UIColor.red
                add(colors: [.red, .green, .blue])
                
            }
            
            context("initial state") {
                it("should have the correct items") {
                    expect(view) == snapshot()
                }
            }
            
            context("remove items") {
                beforeEach {
                    stackView.removeAll()
                }
                
                it("shouls have an empty stackview") {
                    expect(view) == snapshot()
                }
                
                it("should have another stackview") {
                    add(colors: [.orange, .brown, .purple])
                    expect(view) == snapshot()
                }
            }
        }
    }
}
