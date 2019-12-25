//
//  AppStoreTests.swift
//  shoppingListTests
//
//  Created by d-pasko on 2019/12/25.
//  Copyright © 2019 Damian Pasko. All rights reserved.
//

import XCTest
@testable import shoppingList

class AppStoreTests: XCTestCase {
    
    func test_store() {
        let store = AppStore()
        let mockItem1 = Item(name: "mockItem1", date: Date(), prority: .low)
        let mockItem2 = Item(name: "mockItem2", date: Date(timeIntervalSince1970: 10000), prority: .medium)
        let mockItem3 = Item(name: "mockItem3", date: Date(timeIntervalSinceNow: -10000), prority: .high)
        
        store.dispatch(action: .addItem(item: mockItem1))
        store.dispatch(action: .addItem(item: mockItem2))
        store.dispatch(action: .addItem(item: mockItem3))
        
        store.dispatch(action: .sort(by: .priority))
        
        store.dispatch(action: .removeItem(at: .init(arrayLiteral: 2)))
        
        store.dispatch(action: .sort(by: .date))
        
        let expectedState = AppState(items: [mockItem3, mockItem2], sortType: .date)
        
        XCTAssertEqual(store.state, expectedState)
    }

}
