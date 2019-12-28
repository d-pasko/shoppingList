//
//  AddItemView.swift
//  shoppingList
//
//  Created by Damian Pasko on 2019/12/05.
//  Copyright © 2019 Damian Pasko. All rights reserved.
//

import SwiftUI

struct AddItemView: View {
    @EnvironmentObject private var store: AppStore
    
    @State private var nameText: String = ""
    @State private var priorityField: Priority = .medium
    @State private var dateField: Date = Date()
    @Binding var isAddingMode: Bool
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $nameText)
                Picker(selection: $priorityField, label: Text("Priority")) {
                    Text("Low").tag(Priority.low)
                    Text("Medium").tag(Priority.medium)
                    Text("High").tag(Priority.high)
                }
                DatePicker(selection: $dateField, displayedComponents: .date) {
                    Text("Date")
                }
            }
            .navigationBarTitle("Item Details", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    self.isAddingMode = false
                }) {
                    Text("Cancel")
                },
                trailing: Button(action: {
                    let item = Item(
                        name: self.nameText,
                        date: self.dateField,
                        priority: self.priorityField
                    )
                    self.store.dispatch(action: .addItem(item: item))
                    self.isAddingMode = false
                }) {
                    Text("Save")
                }
                .disabled(nameText.isEmpty)
            )
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(isAddingMode: Binding.constant(false))
            .environmentObject(AppStore())
    }
}
