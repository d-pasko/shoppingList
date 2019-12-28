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
        let sutStore = AppStore()
        let item1 = Item(name: "fake item1", date: Date(), priority: .low)
        let item2 = Item(name: "fake item2", date: Date(timeIntervalSince1970: 10000), priority: .medium)
        let item3 = Item(name: "fake item3", date: Date(timeIntervalSinceNow: -10000), priority: .high)
        
        sutStore.dispatch(action: .addItem(item: item1))
        sutStore.dispatch(action: .addItem(item: item2))
        sutStore.dispatch(action: .addItem(item: item3))
        
        sutStore.dispatch(action: .sort(by: .priority))
        
        sutStore.dispatch(action: .removeItem(at: .init(arrayLiteral: 2)))
        
        sutStore.dispatch(action: .sort(by: .date))
        
        let expectedState = AppState(items: [item3, item2], sortType: .date)
        
        XCTAssertEqual(sutStore.state, expectedState)
    }

}
