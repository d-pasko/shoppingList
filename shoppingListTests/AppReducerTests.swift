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
    let items = [Item(name: "fake item", date: .init(timeIntervalSinceNow: -10), prority: .low),
                 Item(name: "fake item", date: .init(timeIntervalSince1970: 10), prority: .high)]
    let sortType = SortType.date
    lazy var oldState = AppState(items: items, sortType: sortType)

    func test_addItem() {
        let item = Item(name: "fake item", date: .init(timeIntervalSince1970: 999), prority: .medium)
        let expectedState = AppState(items: items + [item], sortType: sortType)
        
        XCTAssertEqual(appReducer(state: oldState, action: .addItem(item: item)), expectedState)
    }
    
    func test_removeItem() {
        let expectedState = AppState(items: [items[1]], sortType: sortType)
        let index = IndexSet(arrayLiteral: 0)
        
        XCTAssertEqual(appReducer(state: oldState, action: .removeItem(at: index)), expectedState)
    }
   
    func test_sort() {
        var sort = SortType.priority
        var expectedState = AppState(items: items.reversed(), sortType: sort)
        
        XCTAssertEqual(appReducer(state: oldState, action: .sort(by: sort)), expectedState)
     
        sort = SortType.date
        expectedState = AppState(items: items, sortType: sort)
        
        XCTAssertEqual(appReducer(state: oldState, action: .sort(by: sort)), expectedState)
    }
}
