//
//  ItemListView.swift
//  shoppingList
//
//  Created by Damian Pasko on 2019/12/05.
//  Copyright © 2019 Damian Pasko. All rights reserved.
//

import SwiftUI

struct ItemListView: View {
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        List {
            ForEach(store.state.items) { item in
                ItemView(item: item)
            }
            .onDelete {
                self.store.dispatch(action: .removeItem(at: $0))
            }
            .listRowInsets(EdgeInsets())
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
            .environmentObject(AppStore())
    }
}
