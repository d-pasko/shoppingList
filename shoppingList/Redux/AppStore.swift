//
//  AppStore.swift
//  shoppingList
//
//  Created by Damian Pasko on 2019/12/05.
//  Copyright © 2019 Damian Pasko. All rights reserved.
//

import SwiftUI

final class AppStore: ObservableObject {
    @Published private(set) var state: AppState
    
    init(state: AppState = .init(items: [Item]())) {
        self.state = state
    }
    
    public func dispatch(action: AppAction) {
        state = appReducer(state: state, action: action)
    }
}
