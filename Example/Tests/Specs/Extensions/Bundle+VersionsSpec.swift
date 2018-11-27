//
//  Bundle+VersionsSpec.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 12/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import Stella

private class MockedBundle: Bundle {
    
    override var infoDictionary: [String: Any]? {
        return [
            "CFBundleShortVersionString": "CFBundleShortVersionStringValue",
            "CFBundleVersion": "CFBundleVersionValue"
        ]
    }
    
}

class BundleVersionsSpec: QuickSpec {
    
    override func spec() {
        describe("Bundle+Versions") {
            var bundle: Bundle!
            
            beforeEach {
                bundle = MockedBundle()
            }
            
            it("should contain the correct short version string") {
                expect(bundle.shortVersionString) == "CFBundleShortVersionStringValue"
            }
            
            it("should contain the correct bundle version string") {
                expect(bundle.bundleVersion) == "CFBundleVersionValue"
            }
        }
    }
    
}
