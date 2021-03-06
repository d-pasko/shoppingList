//
//  ItemTests.swift
//  shoppingListTests
//
//  Created by d-pasko on 2019/12/25.
//  Copyright © 2019 Damian Pasko. All rights reserved.
//

import XCTest
@testable import shoppingList

class ItemTests: XCTestCase {
    
    func test_item_init() {
        let name = "fake item"
        let date = Date(timeIntervalSince1970: 9999)
        let priority = Priority.medium
        let sut = Item(name: name, date: date, priority: priority)

        XCTAssertEqual(sut.name, name)
        XCTAssertEqual(sut.date, date)
        XCTAssertEqual(sut.priority, priority)
    }
    
    func test_item_not_equal() {
        let name = "fake item"
        let date = Date(timeIntervalSince1970: 9999)
        let priority = Priority.medium
        let sutItem = Item(name: name, date: date, priority: priority)
        let notExpectedItem = Item(name: name, date: date, priority: priority)
        
        XCTAssertNotEqual(sutItem, notExpectedItem)
    }

    func test_item_equal() {
        let name = "fake item"
        let date = Date(timeIntervalSince1970: 9999)
        let priority = Priority.medium
        let uuid = UUID()
        let sutItem = Item(id: uuid, name: name, date: date, priority: priority)
        let expectedItem = Item(id: uuid, name: name, date: date, priority: priority)
        
        XCTAssertEqual(sutItem, expectedItem)
    }
    
}

extension Item: Equatable {
    public static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.date == rhs.date &&
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.priority == rhs.priority
    }
}
