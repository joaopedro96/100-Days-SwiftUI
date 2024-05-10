//
//  ContentView.swift
//  WeSplit
//
//  Created by João Pedro Mata on 01/05/24.
//

import SwiftUI

struct ContentView: View {
	@State private var checkAmount = 0.0
	@State private var numberOfPeople = 2
	@State private var tipPercentage = 20
	@FocusState private var isShowingKeyboard: Bool

	private let tipPercentages = [10, 15, 20 , 25, 0]

	private let localCurrency = Locale.current.currency?.identifier ?? "USD"

	private var totalAmount: Double {
		let tipSelection = Double(tipPercentage)
		let fullPrice = checkAmount * (1 + tipSelection/100)
		return fullPrice
	}

	private var totalPerPerson: Double {
		let tipSelection = Double(tipPercentage)
		let numberPeople = Double(numberOfPeople + 2)
		let fullPrice = checkAmount * (1 + tipSelection/100)
		return fullPrice / numberPeople
	}

    var body: some View {
		NavigationStack {
			Form {
				Section {
					TextField("Amount", value: $checkAmount, format: .currency(code: localCurrency))
						.keyboardType(.decimalPad)
						.focused($isShowingKeyboard)

					Picker("Number of People", selection: $numberOfPeople) {
						ForEach(2..<100) {
							Text("\($0) people")
						}
					}
				}

				Section("How much do you wanna tip?") {
					Picker("Tip percentage", selection: $tipPercentage) {
						ForEach(tipPercentages, id: \.self) {
//						ForEach(0..<101) {
							Text("\($0)")
						}
					}
					.pickerStyle(.segmented)
//					.pickerStyle(.navigationLink)
				}

				Section("Total amount") {
					Text(totalAmount, format: .currency(code: localCurrency))
						.foregroundStyle(tipPercentage == 0 ? .red : .primary)
				}

				Section("Amount per person") {
					Text(totalPerPerson, format: .currency(code: localCurrency))
				}
			}
			.navigationTitle("WeSplit")
			.toolbar {
				if isShowingKeyboard {
					Button("Done") {
						isShowingKeyboard = false
					}
				}
			}
		}
    }
}

#Preview {
    ContentView()
}
