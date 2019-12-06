//
//  AppAction.swift
//  shoppingList
//
//  Created by Damian Pasko on 2019/12/05.
//  Copyright © 2019 Damian Pasko. All rights reserved.
//

import Foundation

enum AppAction {
    case addItem(item: Item)
    case removeItem(at: IndexSet)    
    case sort(by: SortType)
}
