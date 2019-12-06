//
//  TrailingButtons.swift
//  shoppingList
//
//  Created by Damian Pasko on 2019/12/05.
//  Copyright © 2019 Damian Pasko. All rights reserved.
//

import SwiftUI

struct TrailingView: View {
    @EnvironmentObject var store: AppStore
    
    var body: some View {
        HStack(alignment: .center, spacing: 30) {
            Button(action: {
                switch self.store.state.sortType {
                case .priority:
                    self.store.dispatch(action: .sort(by: .date))
                default:
                    self.store.dispatch(action: .sort(by: .priority))
                }
            }) {
                Image(systemName: "arrow.up.arrow.down")
            }
            EditButton()
        }
    }
}

struct TrailingView_Previews: PreviewProvider {
    static var previews: some View {
        TrailingView()
            .environmentObject(AppStore())
    }
}
