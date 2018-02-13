//
//  UICollectionView+ReuseSpec.swift
//  Tests
//
//  Created by Jelle Vandebeeck on 12/02/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import Stella

private class MockedCollectionViewCell: UICollectionViewCell {
}

private class MockedCollectionReusableView: UICollectionReusableView {
}

private class MockedCollectionView: UICollectionView {
    private(set) var dequeuedIdentifier: String?
    private(set) var dequeuedIndexPath: IndexPath?
    
    override func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
        dequeuedIdentifier = identifier
        dequeuedIndexPath = indexPath
        return MockedCollectionViewCell()
    }

    private(set) var dequeuedSupplementaryIdentifier: String?
    private(set) var dequeuedSupplementaryKind: String?
    private(set) var dequeuedSupplementaryIndexPath: IndexPath?
    
    override func dequeueReusableSupplementaryView(ofKind elementKind: String, withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionReusableView {
        dequeuedSupplementaryKind = elementKind
        dequeuedSupplementaryIndexPath = indexPath
        dequeuedSupplementaryIdentifier = identifier
        return MockedCollectionReusableView()
    }

    private(set) var registeredNib: UINib?
    private(set) var registeredCellIdentifier: String?

    override func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String) {
        registeredNib = nib
        registeredCellIdentifier = identifier
    }

    private(set) var registeredSupplementaryNib: UINib?
    private(set) var registeredSupplementaryKind: String?
    private(set) var registeredSupplementaryIdentifier: String?

    override func register(_ nib: UINib?, forSupplementaryViewOfKind kind: String, withReuseIdentifier identifier: String) {
        registeredSupplementaryNib = nib
        registeredSupplementaryKind = kind
        registeredSupplementaryIdentifier = identifier
    }
    
}

class UICollectionViewReuseSpec: QuickSpec {
    
    override func spec() {
        describe("UICollectionView+Reuse") {
            var collectionView: MockedCollectionView!
            
            beforeEach {
                collectionView = MockedCollectionView(frame: .zero,
                                                      collectionViewLayout: UICollectionViewFlowLayout())
            }
            
            it("should deque the correct cell") {
                let indexPath = IndexPath(item: 0, section: 0)
                _ = collectionView.dequeueReusableCell(for: indexPath) as MockedCollectionViewCell
                
                expect(collectionView.dequeuedIdentifier) == MockedCollectionViewCell.reuseIdentifier
                expect(collectionView.dequeuedIndexPath) == indexPath
            }
            
            it("should deque the correct supplementary view") {
                let indexPath = IndexPath(item: 0, section: 0)
                _ = collectionView.dequeueReusableSupplementaryView(ofKind: "Some", for: indexPath) as MockedCollectionReusableView
                
                expect(collectionView.dequeuedSupplementaryIdentifier) == MockedCollectionReusableView.reuseIdentifier
                expect(collectionView.dequeuedSupplementaryIndexPath) == indexPath
                expect(collectionView.dequeuedSupplementaryKind) == "Some"
            }

            it("should register the correct cell") {
                collectionView.register(class: MockedCollectionViewCell.self)

                expect(collectionView.registeredNib).toNot(beNil())
                expect(collectionView.registeredCellIdentifier) == MockedCollectionViewCell.reuseIdentifier
            }

            it("should register the correct supplementary view") {
                collectionView.register(class: MockedCollectionReusableView.self, forSupplementaryViewOfKind: "Some")

                expect(collectionView.registeredSupplementaryNib).toNot(beNil())
                expect(collectionView.registeredSupplementaryKind) == "Some"
                expect(collectionView.registeredSupplementaryIdentifier) == MockedCollectionReusableView.reuseIdentifier
            }
        }
    }
    
}
