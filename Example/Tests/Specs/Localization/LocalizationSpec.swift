//
//  LocalizationSpec.swift
//  Stella
//
//  Created by Jelle Vandebeeck on 07/06/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Stella

class LocalizationSpec: QuickSpec {
    override func spec() {
        
        describe("localization") {
            it("should localize the current string to the correct language") {
                let key = "some_key"
                let nativeLocalized = NSLocalizedString(key, comment: "")
                expect(key.localizedString).to(equal(nativeLocalized))
            }
        }
        
    }
}
