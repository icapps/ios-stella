//
//  UICollectionView+Reuse.swift
//  Keychain
//
//  Created by Jelle Vandebeeck on 11/02/2018.
//

import UIKit

extension UICollectionView {
    /// We dequeue the cell and infer the cell to the correct type. This way we don't have to
    /// force cast every time we try to dequeue a cell.
    ///
    /// Example: `collectionView.dequeueReusableCell(for: IndexPath(...)) as CollectionViewCell`
    public func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        // swiftlint:disable force_cast
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    /// We dequeue the reusable view and infer the reusable view to the correct type. This way we
    /// don't have to force cast every time we try to dequeue a reusable view.
    ///
    /// Example: `collectionView.dequeueReusableSupplementaryView(ofKind: kind,
    ///                                                           for: IndexPath(...)) as UICollectionReusableView`
    public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind: String,
                                                                              for indexPath: IndexPath) -> T {
        // swiftlint:disable force_cast
        return dequeueReusableSupplementaryView(ofKind: ofKind,
                                                withReuseIdentifier: T.reuseIdentifier,
                                                for: indexPath) as! T
    }
    
    /// Register a cell class with the same name as a reusable cell.
    public func register<T: UICollectionViewCell>(class classType: T.Type) {
        register(classType.nib, forCellWithReuseIdentifier: classType.reuseIdentifier)
    }
    
    /// Register a reusable view class with the same name as a reusable view.
    public func register<T: UICollectionReusableView>(class classType: T.Type, forSupplementaryViewOfKind: String) {
        register(classType.nib,
                 forSupplementaryViewOfKind: forSupplementaryViewOfKind,
                 withReuseIdentifier: classType.reuseIdentifier)
    }
}
