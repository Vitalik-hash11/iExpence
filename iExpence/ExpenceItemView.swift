//
//  SwiftUIView.swift
//  iExpence
//
//  Created by newbie on 20.07.2022.
//

import SwiftUI

struct ExpenceItemView: View {
    @State var item: ExpenceItem
    
    var body: some View {
        HStack {
            VStack(spacing: 10) {
                Text(item.name)
                    .font(.title)
                Text(item.type)
            }
            Spacer()
            Text(String(item.amount))
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenceItemView(item: ExpenceItem(name: "test", type: "test", amount: 20))
    }
}
