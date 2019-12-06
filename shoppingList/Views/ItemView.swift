//
//  ItemView.swift
//  shoppingList
//
//  Created by Damian Pasko on 2019/12/05.
//  Copyright © 2019 Damian Pasko. All rights reserved.
//

import SwiftUI

struct ItemView: View {
    let item: Item
    private var backgroundColor: Color {
        switch item.prority {
        case .low:
            return .green
        case .medium:
            return .orange
        case .high:
            return .red
        }
    }
    
    var body: some View {
        HStack {
            Text(item.name)
            Spacer()
            Text(item.date.simpleFormat)
        }
        .padding()
        .background(backgroundColor)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: Item(name: "iPhone", date: Date(), prority: .medium))
            .previewLayout(.fixed(width: 400, height: 50))
    }
}
