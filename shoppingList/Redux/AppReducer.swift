//
//  AppReducer.swift
//  shoppingList
//
//  Created by Damian Pasko on 2019/12/05.
//  Copyright © 2019 Damian Pasko. All rights reserved.
//

func appReducer(state: AppState, action: AppAction) -> AppState {
    var state = state
    
    switch action {
    case .addItem(let item):
        state.items.append(item)
    case .removeItem(let indexSet):
        state.items.remove(atOffsets: indexSet)
    case .sort(let type):
        switch type {
        case .date:
            state.items.sort { (item1, item2) -> Bool in
                item1.date > item2.date
            }
            state.sortType = .date
        case .priority:
            state.items.sort { (item1, item2) -> Bool in
                item1.priority.rawValue > item2.priority.rawValue
            }
            state.sortType = .priority
        }
    }
    
    return state
}
