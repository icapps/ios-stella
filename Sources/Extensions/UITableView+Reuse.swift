//
//  UITableView+Reuse.swift
//  FBSnapshotTestCase
//
//  Created by Hannes Van den Berghe on 10/03/2018.
//

import UIKit

extension UITableView {
    
    /// Register
    
    func register<T: UITableViewCell>(class classType: T.Type) {
        register(classType.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerHeaderFooter<T: UIView>(class classType: T.Type) {
        register(classType.nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    /// Dequeue
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIdentifier identifier: String) -> T {
        let cell = dequeueReusableCell(withIdentifier: identifier) as! T
        return cell
    }
    
    func dequeueReusableHeaderFooter<T: UIView>(forSection section: Int) -> T {
        let cell = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T
        return cell
    }
    
    /// Get
    func cellForRow<T: UITableViewCell>(_ indexPath: IndexPath) -> T {
        let cell = cellForRow(at: indexPath) as! T
        return cell
    }
}


