//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Edgardo Valencia on 16/12/24.
//

import SwiftUI

struct ExpenseItemView: View {
    @State var expenseItem: ExpenseItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(expenseItem.name)
                    .font(.headline)
                Text(expenseItem.type)
            }
            
            Spacer()
            
            
            Text(expenseItem.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .foregroundStyle(expenseItem.amount >= 50 && expenseItem.amount <= 100 ? .orange : expenseItem.amount >= 100 ? .red : .black)
        }
    }
}


