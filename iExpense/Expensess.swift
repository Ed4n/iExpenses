//
//  Expensess.swift
//  iExpense
//
//  Created by Edgardo Valencia on 10/12/24.
//

import SwiftUI

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

@Observable
class Expensess {
    var items = [ExpenseItem]()
}
