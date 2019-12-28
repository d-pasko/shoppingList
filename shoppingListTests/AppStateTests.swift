//
//  AppStateTests.swift
//  shoppingListTests
//
//  Created by d-pasko on 2019/12/25.
//  Copyright © 2019 Damian Pasko. All rights reserved.
//

import XCTest
@testable import shoppingList

class AppStateTests: XCTestCase {

    func test_equal() {
        let mockItems = [Item(name: "mockItem", date: .init(timeIntervalSinceNow: -10), priority: .high),
                         Item(name: "mockItem", date: .init(timeIntervalSince1970: 10), priority: .low)]
        
        let mockState = AppState(items: mockItems, sortType: .priority)
                
        XCTAssertEqual(mockState, AppState(items: mockItems, sortType: .priority))
    }
    
    func test_notEqual() {
        let mockItems = [Item(name: "mockItem", date: .init(timeIntervalSinceNow: -10), priority: .high),
                         Item(name: "mockItem", date: .init(timeIntervalSince1970: 10), priority: .low),
                         Item(name: "mockItem", date: .init(timeIntervalSince1970: 110), priority: .medium)]
        
        let mockState = AppState(items: mockItems.reversed(), sortType: .date)
                
        XCTAssertNotEqual(mockState, AppState(items: mockItems, sortType: .date))
    }
}

extension AppState: Equatable {
    public static func == (lhs: AppState, rhs: AppState) -> Bool {
        lhs.items == rhs.items &&
        lhs.sortType == rhs.sortType
    }
}
