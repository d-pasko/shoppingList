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
    
    func test_item_equal() {
        let mockID = UUID()
        let mockName = "mockItem"
        let mockDate = Date(timeIntervalSinceNow: -1000)
        let mockPrority = Priority.medium
        let mockItem1 = Item(id: mockID, name: mockName, date: mockDate, prority: mockPrority)
        let mockItem2 = Item(id: mockID, name: mockName, date: mockDate, prority: mockPrority)
        
        XCTAssertEqual(mockItem1, mockItem2)
    }
    
    func test_item_not_equal() {
        let mockID = UUID()
        let mockName = "mockItem"
        let mockDate = Date(timeIntervalSinceNow: -1000)
        let mockPrority = Priority.medium
        let mockItem1 = Item(id: mockID, name: mockName, date: mockDate, prority: mockPrority)
        let mockItem2 = Item(name: mockName, date: mockDate, prority: mockPrority)
        
        XCTAssertNotEqual(mockItem1, mockItem2)
    }

}

extension Item: Equatable {
    public static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.date == rhs.date &&
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.prority == rhs.prority
    }
}
