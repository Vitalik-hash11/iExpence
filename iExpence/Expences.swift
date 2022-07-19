//
//  Expences.swift
//  iExpence
//
//  Created by newbie on 19.07.2022.
//

import Foundation

class Expences: ObservableObject {
    @Published var items = [ExpenceItem]()
}
