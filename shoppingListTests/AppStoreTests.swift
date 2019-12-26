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
        let item1 = Item(name: "fake item1", date: Date(), prority: .low)
        let item2 = Item(name: "fake item2", date: Date(timeIntervalSince1970: 10000), prority: .medium)
        let item3 = Item(name: "fake item3", date: Date(timeIntervalSinceNow: -10000), prority: .high)
        
        store.dispatch(action: .addItem(item: item1))
        store.dispatch(action: .addItem(item: item2))
        store.dispatch(action: .addItem(item: item3))
        
        store.dispatch(action: .sort(by: .priority))
        
        store.dispatch(action: .removeItem(at: .init(arrayLiteral: 2)))
        
        store.dispatch(action: .sort(by: .date))
        
        let expectedState = AppState(items: [item3, item2], sortType: .date)
        
        XCTAssertEqual(store.state, expectedState)
    }

}
