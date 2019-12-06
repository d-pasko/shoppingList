//
//  AddButton.swift
//  shoppingList
//
//  Created by Damian Pasko on 2019/12/05.
//  Copyright © 2019 Damian Pasko. All rights reserved.
//

import SwiftUI

struct AddButton: View {
    @Binding var isAddingMode: Bool
    
    var body: some View {
        Button(action: {
            self.isAddingMode = true
        }) {
            Image(systemName: "plus")
        }
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(isAddingMode: Binding.constant(false))
    }
}
