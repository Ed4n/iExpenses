//
//  AddExpense.swift
//  iExpense
//
//  Created by Edgardo Valencia on 10/12/24.
//

import SwiftUI

struct AddExpense: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var type: String = "Personal"
    @State private var amount: Double = 0
    
    var expenses: Expensess
    
    
    
    var body: some View {
        let types = expenses.getTypes()
        
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
            .toolbar {
                Button("Save"){
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
            
                }
            }
        }
    }
}

#Preview {
    AddExpense(expenses: Expensess())
}
