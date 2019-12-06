//
//  Item.swift
//  shoppingList
//
//  Created by Damian Pasko on 2019/12/05.
//  Copyright © 2019 Damian Pasko. All rights reserved.
//

import Foundation

struct Item: Identifiable {
    let id: UUID = .init()
    let name: String
    let date: Date
    let prority: Priority
}
