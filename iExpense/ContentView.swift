//
//  ContentView.swift
//  iExpense
//
//  Created by Edgardo Valencia on 10/12/24.
//

import SwiftUI

// Adding the Identifiable let know swift that this type of date is identifiable somehow
//for this the item must have an ID


struct ContentView: View {
    @State private var expenses = Expensess()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                //Doing the identifiable thing in the ExpenseItem, let us do this with the ForEach, It no longer need the id property.
                ForEach(expenses.items) { item in
                    Text(item.name)
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
