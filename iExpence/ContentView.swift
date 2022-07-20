//
//  ContentView.swift
//  iExpence
//
//  Created by newbie on 17.07.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expences = Expences()
    @State private var isSheetShown = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expences.items) { item in
                    HStack {
                        VStack(spacing: 10) {
                            Text(item.name)
                            Text(item.type)
                        }
                        Spacer()
                        Text(String(item.amount))
                    }
                }
                .onDelete { indexSet in
                    expences.items.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("iExpence")
            .toolbar {
                Button {
                    isSheetShown = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $isSheetShown) {
                AddExpenceView(expences: expences)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
