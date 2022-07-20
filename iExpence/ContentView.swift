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
                Section(header: Text("Personal")) {
                    ForEach(expences.personalExpences) { item in
                        if item.amount <= 10 {
                            ExpenceItemView(item: item)
                            .listRowBackground(Color.green)
                        } else if item.amount < 100 {
                            ExpenceItemView(item: item)
                            .listRowBackground(Color.yellow)
                        } else {
                            ExpenceItemView(item: item)
                            .listRowBackground(Color.red)
                        }
                    }
                    .onDelete { indexSet in
                        expences.personalExpences.remove(atOffsets: indexSet)
                    }
                 }
                Section(header: Text("Business")) {
                    ForEach(expences.businessExpences) { item in
                        if item.amount <= 10 {
                            ExpenceItemView(item: item)
                            .listRowBackground(Color.green)
                        } else if item.amount < 100 {
                            ExpenceItemView(item: item)
                            .listRowBackground(Color.yellow)
                        } else {
                            ExpenceItemView(item: item)
                            .listRowBackground(Color.red)
                        }
                    }
                    .onDelete { indexSet in
                        expences.businessExpences.remove(atOffsets: indexSet)
                    }
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
