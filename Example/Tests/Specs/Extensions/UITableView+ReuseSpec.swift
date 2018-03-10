//
//  UITableView+ReuseSpec.swift
//  Tests
//
//  Created by Hannes Van den Berghe on 10/03/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble

@testable import Stella

private class MockedTableViewCell: UITableViewCell {
    
}

private class MockedTableView: UITableView {
    
    private(set) var dequeuedIdentifier: String?
    private(set) var dequeueIndexPath: IndexPath?
    
    override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        dequeuedIdentifier = identifier
        dequeueIndexPath = indexPath
        return MockedTableViewCell()
    }
    
    private(set) var dequeuedReusableIdentfier: String?

    override func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? {
        dequeuedReusableIdentfier = identifier
        return MockedTableViewCell()
    }
    
    private(set) var registeredNib: UINib?
    private(set) var registeredCellIdentifier: String?
    
    override func register(_ nib: UINib?, forCellReuseIdentifier identifier: String) {
        registeredNib = nib
        registeredCellIdentifier = identifier
    }
    
    private(set) var registeredClass: AnyClass?
    private(set) var registeredCellReuseIdentifier: String?
    
    override func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String) {
        registeredClass = cellClass
        registeredCellReuseIdentifier = identifier
    }
    
    // TODO: Header Footer
}

class UITableViewReuseSpec: QuickSpec {
    override func spec() {
        describe("UITableView+Reuse") {
            var tableView: MockedTableView!
            
            beforeEach {
                tableView = MockedTableView(frame: .zero, style: .plain)
            }
            
            it("should dequeue the correct cell") {
                let indexPath = IndexPath(row: 0, section: 0)
                _ = tableView.dequeueReusableCell(forIndexPath: indexPath) as MockedTableViewCell
                
                expect(tableView.dequeuedIdentifier) == MockedTableViewCell.reuseIdentifier
                expect(tableView.dequeueIndexPath) == indexPath
            }
            
            it("should dequeue the correct cell with identifier") {
                let identifier = "MockedTableViewCell"
                _ = tableView.dequeueReusableCell(forIdentifier: identifier) as MockedTableViewCell
                
                expect(tableView.dequeuedReusableIdentfier) == identifier
            }

        }
    }
}
