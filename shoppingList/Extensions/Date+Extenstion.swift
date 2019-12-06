//
//  Date+Extenstion.swift
//  shoppingList
//
//  Created by Damian Pasko on 2019/12/05.
//  Copyright © 2019 Damian Pasko. All rights reserved.
//

import Foundation

extension Date {
    var simpleFormat: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        
        return dateFormatter.string(from: self)
    }
}
