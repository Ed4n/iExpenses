//
//  ContentView.swift
//  iExpense
//
//  Created by Edgardo Valencia on 10/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expensess()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                //Doing the identifiable thing in the ExpenseItem, let us do this with the ForEach, It no longer need the id property.
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                            
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpenses")
            .toolbar {
                Button("Add Expense", systemImage: "plus"){
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense){
                AddExpense(expenses: expenses)
            }
            
        }
    }
    
    func removeItems(at offSets: IndexSet) {
        expenses.items.remove(atOffsets: offSets)
    }
}

#Preview {
    ContentView()
}
