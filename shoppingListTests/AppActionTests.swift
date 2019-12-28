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
        let item = Item(name: "fake item", date: .init(timeIntervalSinceNow: -2000), priority: .medium)
        
        let sutAction = AppAction.addItem(item: item)
        
        XCTAssertEqual(sutAction, .addItem(item: item))
    }
    
    func test_removeItem() {
        let index = IndexSet(arrayLiteral: 99)
        
        let sutAction = AppAction.removeItem(at: index)
        
        XCTAssertEqual(sutAction, .removeItem(at: index))
    }
    
    func test_sort() {
        var sortType = SortType.priority
        var sutAction = AppAction.sort(by: sortType)
        
        XCTAssertEqual(sutAction, .sort(by: sortType))
        
        sortType = .date
        sutAction = .sort(by: sortType)
        
        XCTAssertEqual(sutAction, .sort(by: sortType))
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
