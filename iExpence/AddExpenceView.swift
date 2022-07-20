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
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) { type in
                        Text(type)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                    .keyboardType(.decimalPad)
                Button("Add") {
                    if type == "Personal" {
                        expences.personalExpences.append(ExpenceItem(name: name, type: type, amount: amount))
                    } else {
                        expences.businessExpences.append(ExpenceItem(name: name, type: type, amount: amount))
                    }
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
