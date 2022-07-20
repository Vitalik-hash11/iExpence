//
//  AddExpenceView.swift
//  iExpence
//
//  Created by newbie on 19.07.2022.
//

import Foundation
import SwiftUI

struct AddExpenceView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var expences: Expences
    @State private var name = ""
    @State private var type = ""
    @State private var amount = 0.0
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Type", text: $type)
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                Button("Add") {
                    expences.items.append(ExpenceItem(name: name, type: type, amount: amount))
                    dismiss()
                }
            }
            .navigationTitle("Add new expence")
        }
        
    }
}

struct AddExpenceView_Preview: PreviewProvider {
    static var previews: some View {
        AddExpenceView(expences: Expences())
    }
}
