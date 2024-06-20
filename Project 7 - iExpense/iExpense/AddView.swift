//
//  AddView.swift
//  iExpense
//
//  Created by João Pedro Mata on 18/06/24.
//

import SwiftUI

struct AddView: View {
	@Environment(\.dismiss) var dismiss

	@State private var name = ""
	@State private var type = "Personal"
	@State private var amount = 0.0

	let types = ["Personal", "Business"]

	var expenses: Expenses

    var body: some View {
		NavigationStack {
			Form {
				TextField("Name", text: $name)

				Picker("Type", selection: $type) {
					ForEach(types, id: \.self) {
						Text($0)
					}
				}

				TextField("Amount", value: $amount, format: .currency(code: "USD"))
					.keyboardType(.decimalPad)
			}
			.navigationTitle("Add new expense")
			.toolbar {
				Button("Save") {
					let expenseItem = ExpenseItem(name: name, type: type, amount: amount)
					expenses.items.append(expenseItem)
					dismiss()
				}
			}
		}
    }
}

#Preview {
	AddView(expenses: Expenses())
}
