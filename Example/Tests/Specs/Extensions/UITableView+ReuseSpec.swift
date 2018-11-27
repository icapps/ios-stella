//
//  UITableView+ReuseSpec.swift
//  Tests
//
//  Created by Hannes Van den Berghe on 10/03/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import Stella

private class MockedTableHeaderView: UITableViewHeaderFooterView {
    
}

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
    
    private(set) var registerdHeaderNib: UINib?
    private(set) var registerdHeaderIdentifier: String?

    override func register(_ nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: String) {
        registerdHeaderNib = nib
        registerdHeaderIdentifier = identifier
    }
    
    private(set) var dequeuedHeaderIdentifier: String?
    
    override func dequeueReusableHeaderFooterView(withIdentifier identifier: String) -> UITableViewHeaderFooterView? {
        dequeuedHeaderIdentifier = identifier
        return MockedTableHeaderView()
    }
    
    private(set) var cellIndexPath: IndexPath?

    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
        cellIndexPath = indexPath
        return MockedTableViewCell()
    }
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
    
            it("should register the correct cell") {
                tableView.register(class: MockedTableViewCell.self)
                
                expect(tableView.registeredNib).notTo(beNil())
                expect(tableView.registeredCellIdentifier) == MockedTableViewCell.reuseIdentifier
            }
            
            it("should register the correct header") {
                tableView.registerHeaderFooter(class: MockedTableHeaderView.self)
                
                expect(tableView.registerdHeaderNib).notTo(beNil())
                expect(tableView.registerdHeaderIdentifier) == MockedTableHeaderView.reuseIdentifier
            }
            
            it("should dequeue the correct header") {
                _ = tableView.dequeueReusableHeaderFooter(forIdentifier: MockedTableHeaderView.reuseIdentifier)
                expect(tableView.dequeuedHeaderIdentifier) == MockedTableHeaderView.reuseIdentifier
            }
            
            it("should return the correct cell") {
                let indexPath = IndexPath(row: 0, section: 1)
                _ = tableView.cellForRow(indexPath)
                
                expect(tableView.cellIndexPath).notTo(beNil())
            }
            
        }
    }
}
