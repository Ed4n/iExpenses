//
//  AddExpense.swift
//  iExpense
//
//  Created by Edgardo Valencia on 10/12/24.
//

import SwiftUI

struct AddExpense: View {
    @State private var name: String = ""
    @State private var type: String = "Personal"
    @State private var amount: Double = 0
    
    var expenses: Expensess
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) { type in
                        Text(type)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add Expense")
        }
    }
}

#Preview {
    AddExpense(expenses: Expensess())
}
