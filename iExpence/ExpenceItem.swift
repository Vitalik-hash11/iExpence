//
//  ExpenceItem.swift
//  iExpence
//
//  Created by newbie on 19.07.2022.
//

import Foundation

struct ExpenceItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
