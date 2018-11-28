//
//  CALayer+ShadowSpec.swift
//  Tests
//
//  Created by Hannes Van den Berghe on 28/11/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Stella
import Nimble_Snapshots

class CALayerShadowSpec: QuickSpec {
    
    override func spec() {
        
        describe("CALayer") {
            
            var view: UIView!
            var subView: UIView!
            let frame = CGRect(x: 0, y: 0, width: 250, height: 250)
            
            beforeEach {
                view = UIView(frame: frame)
                view.backgroundColor = UIColor.white
                subView = UIView(frame: frame)
                subView.backgroundColor = UIColor.green
                
                view.addSubview(subView)
                subView.constrain(to: view, insets: UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25))
            }
            
            context("apply shadow") {
                
                beforeEach {
                    subView.layer.applyShadow()
                }
                
                it("should show the shadow") {
                    expect(view) == snapshot()
                }
                
                context("remove shadow") {
                    
                    beforeEach {
                        subView.layer.removeShadow()
                    }
                    
                    it("should not have a shadow") {
                        expect(view) == snapshot()
                    }
                }
            }
        }
    }
}
