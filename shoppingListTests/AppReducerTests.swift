//
//  AppReducerTests.swift
//  shoppingListTests
//
//  Created by d-pasko on 2019/12/25.
//  Copyright © 2019 Damian Pasko. All rights reserved.
//

import XCTest
@testable import shoppingList

class AppReducerTests: XCTestCase {
    let mockItems = [Item(name: "mockItem", date: .init(timeIntervalSinceNow: -10), priority: .low),
                     Item(name: "mockItem", date: .init(timeIntervalSince1970: 10), priority: .high)]
    let mockSortType = SortType.date
    lazy var mockState = AppState(items: mockItems, sortType: mockSortType)

    func test_addItem() {
        let mockItem = Item(name: "mockItem", date: .init(timeIntervalSince1970: 999), priority: .medium)
        let expectedState = AppState(items: mockItems + [mockItem], sortType: mockSortType)
        
        XCTAssertEqual(appReducer(state: mockState, action: .addItem(item: mockItem)), expectedState)
    }
    
    func test_removeItem() {
        let expectedState = AppState(items: [mockItems[1]], sortType: mockSortType)
        let mockIndex = IndexSet(arrayLiteral: 0)
        
        XCTAssertEqual(appReducer(state: mockState, action: .removeItem(at: mockIndex)), expectedState)
    }
   
    func test_sort() {
        var mockSort = SortType.priority
        var expectedState = AppState(items: mockItems.reversed(), sortType: mockSort)
        
        XCTAssertEqual(appReducer(state: mockState, action: .sort(by: mockSort)), expectedState)
     
        mockSort = SortType.date
        expectedState = AppState(items: mockItems, sortType: mockSort)
        
        XCTAssertEqual(appReducer(state: mockState, action: .sort(by: mockSort)), expectedState)
    }
}
