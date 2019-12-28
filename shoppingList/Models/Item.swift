//
//  Item.swift
//  shoppingList
//
//  Created by Damian Pasko on 2019/12/05.
//  Copyright © 2019 Damian Pasko. All rights reserved.
//

import Foundation

struct Item: Identifiable {
    let id: UUID
    let name: String
    let date: Date
    let priority: Priority
    
    init(id: UUID = .init(), name: String, date: Date, priority: Priority) {
        self.id = id
        self.name = name
        self.date = date
        self.priority = priority
    }
}
