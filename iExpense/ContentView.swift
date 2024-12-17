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
    @State private var showFiltersByType = false
    
    @State private var toggleFiltersByType = false
    
    var body: some View {
        let types = expenses.getTypes()
        
        NavigationStack {
            List {
                //Doing the identifiable thing in the ExpenseItem, let us do this with the ForEach, It no longer need the id property.
                
                if(toggleFiltersByType == true){
                    ForEach(types, id: \.self){ type in
                        Section(header: Text(type).font(.headline)) {
                            ForEach(expenses.items.filter({$0.type == type})){ expense in
                                ExpenseItemView(expenseItem: expense)
                            }
                            .onDelete(perform: removeItems)
                        }
                    }
                    
                }else {
                    ForEach(expenses.items) { item in
                        ExpenseItemView(expenseItem: item)
                    }
                    .onDelete(perform: removeItems)
                }
                
            }
            .navigationTitle("iExpenses")
            .toolbar {
                Button("Filter",
                       systemImage: toggleFiltersByType ?
                       "line.3.horizontal.decrease.circle.fill"
                       : "line.3.horizontal.decrease.circle"){
                    
                    withAnimation {
                        toggleFiltersByType.toggle()
                    }
                }
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
