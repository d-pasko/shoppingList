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

    let items = [Item(name: "fake item", date: .init(timeIntervalSinceNow: -10), priority: .high),
                 Item(name: "fake item", date: .init(timeIntervalSince1970: 10), priority: .low)]

    func test_state_equal() {
        let sutState = AppState(items: items, sortType: .priority)
                
        XCTAssertEqual(sutState, AppState(items: items, sortType: .priority))
    }
    
    func test_state_notEqual() {
        let sutState = AppState(items: items.reversed(), sortType: .date)
                
        XCTAssertNotEqual(sutState, AppState(items: items, sortType: .date))
    }

}

extension AppState: Equatable {
    public static func == (lhs: AppState, rhs: AppState) -> Bool {
        lhs.items == rhs.items &&
        lhs.sortType == rhs.sortType
    }
}
