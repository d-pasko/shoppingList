//
//  AppActionTests.swift
//  shoppingListTests
//
//  Created by d-pasko on 2019/12/25.
//  Copyright © 2019 Damian Pasko. All rights reserved.
//

import XCTest
@testable import shoppingList

class AppActionTests: XCTestCase {

    func test_addItem() {
        let mockItem = Item(name: "MockItem", date: .init(timeIntervalSinceNow: -2000), prority: .medium)
        
        let sutAction = AppAction.addItem(item: mockItem)
        
        XCTAssertEqual(sutAction, AppAction.addItem(item: mockItem))
    }
    
    func test_removeItem() {
        let mockIndex = IndexSet(arrayLiteral: 99)
        
        let sutAction = AppAction.removeItem(at: mockIndex)
        
        XCTAssertEqual(sutAction, AppAction.removeItem(at: mockIndex))
    }
    
    func test_sort() {
        var mockSort = SortType.priority
        var sutAction = AppAction.sort(by: mockSort)
        
        XCTAssertEqual(sutAction, AppAction.sort(by: mockSort))
        
        mockSort = .date
        sutAction = .sort(by: mockSort)
        
        XCTAssertEqual(sutAction, AppAction.sort(by: mockSort))
    }
    
}

extension AppAction: Equatable {
    
    public static func == (lhs: AppAction, rhs: AppAction) -> Bool {
        switch (lhs, rhs) {
        case let (.addItem(itemA), .addItem(item: itemB)):
            return itemA == itemB
        case let (.removeItem(indexA), .removeItem(indexB)):
            return indexA == indexB
        case let (.sort(typeA), .sort(typeB)):
            return typeA == typeB
        default:
          return false
        }
    }
}
