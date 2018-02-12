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
    
    private(set) var dequeuedSupplementaryIdentifier: String?
    private(set) var dequeuedSupplementaryKind: String?
    private(set) var dequeuedSupplementaryIndexPath: IndexPath?
    
    override func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
        dequeuedIdentifier = identifier
        dequeuedIndexPath = indexPath
        return MockedCollectionViewCell()
    }
    
    override func dequeueReusableSupplementaryView(ofKind elementKind: String, withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionReusableView {
        dequeuedSupplementaryKind = elementKind
        dequeuedSupplementaryIndexPath = indexPath
        dequeuedSupplementaryIdentifier = identifier
        return MockedCollectionReusableView()
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
        }
    }
    
}
