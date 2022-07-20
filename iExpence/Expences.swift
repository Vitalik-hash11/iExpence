//
//  Expences.swift
//  iExpence
//
//  Created by newbie on 19.07.2022.
//

import Foundation

class Expences: ObservableObject {
    static let UDKey = "Expences"

    @Published var items = [ExpenceItem]() {
        didSet {
            let expences = try? JSONEncoder().encode(items)
            UserDefaults.standard.set(expences, forKey: Expences.UDKey)
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: Expences.UDKey) {
            if let decodedItems = try? JSONDecoder().decode([ExpenceItem].self, from: data) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
