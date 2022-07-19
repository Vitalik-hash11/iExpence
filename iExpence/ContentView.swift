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
                    Text(item.name)
                }
                .onDelete { indexSet in
                    expences.items.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("iExpence")
            .toolbar {
                Button {
//                    let expence = ExpenceItem(name: "Grosseries", type: "Personal", amount: 20.2)
//                    expences.items.append(expence)
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
