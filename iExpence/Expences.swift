//
//  Expences.swift
//  iExpence
//
//  Created by newbie on 19.07.2022.
//

import Foundation

class Expences: ObservableObject {
    static let PersonlExpencesUDKey = "PersonalExpences"
    static let BusinessExpencesUDKey = "BusinessExpences"

    @Published var personalExpences = [ExpenceItem]() {
        didSet {
            let expences = try? JSONEncoder().encode(personalExpences)
            UserDefaults.standard.set(expences, forKey: Expences.PersonlExpencesUDKey)
        }
    }
    
    @Published var businessExpences = [ExpenceItem]() {
        didSet {
            let expences = try? JSONEncoder().encode(businessExpences)
            UserDefaults.standard.set(expences, forKey: Expences.BusinessExpencesUDKey)
        }
    }
    
    init() {
        
        if let data = UserDefaults.standard.data(forKey: Expences.PersonlExpencesUDKey) {
            if let decodedItems = try? JSONDecoder().decode([ExpenceItem].self, from: data) {
                personalExpences = decodedItems
            }
        }
        
        if let data = UserDefaults.standard.data(forKey: Expences.BusinessExpencesUDKey) {
            if let decodedItems = try? JSONDecoder().decode([ExpenceItem].self, from: data) {
                businessExpences = decodedItems
            }
        }
    }
}
