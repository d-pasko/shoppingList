//
//  ContentView.swift
//  shoppingList
//
//  Created by Damian Pasko on 2019/12/05.
//  Copyright © 2019 Damian Pasko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: AppStore
    @State private var isAddingMode: Bool = false
    
    var body: some View {
        NavigationView {
            ItemListView()
                .navigationBarTitle("Shopping list", displayMode: .inline)
                .navigationBarItems(
                    leading: AddButton(isAddingMode: self.$isAddingMode),
                    trailing: TrailingView()
                )
        }
        .sheet(isPresented: $isAddingMode) {
            AddItemView(isAddingMode: self.$isAddingMode)
                .environmentObject(self.store)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppStore())
    }
}
