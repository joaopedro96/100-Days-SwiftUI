//
//  ContentView.swift
//  iMeasure
//
//  Created by João Pedro Mata on 04/05/24.
//

import SwiftUI

struct ContentView: View {
	@State private var inputValue = 0.0
	@State private var selectedInputUnit: LenghtMeasurementUnit = .cm
	@State private var selectedOutputUnit: LenghtMeasurementUnit = .cm

	private let availableUnits = LenghtMeasurementUnit.allCases

	private var conversionResult: Double {
		let inputMeasurement = Measurement(value: inputValue, unit: selectedInputUnit.unit)
		let outputMeasurement = inputMeasurement.converted(to: selectedOutputUnit.unit)
		return outputMeasurement.value
	}

    var body: some View {
		NavigationStack {
			Form {
				Section("Input value") {
					TextField("Input value", value: $inputValue, format: .number)
						.keyboardType(.decimalPad)

					Picker("Input unit", selection: $selectedInputUnit) {
						ForEach(availableUnits, id: \.self) {
							Text("\($0.rawValue)")
						}
					}
				}

				Section("Output unit") {
					Picker("Output unit", selection: $selectedOutputUnit) {
						ForEach(availableUnits, id: \.self) {
							Text($0.rawValue)
						}
					}
					.pickerStyle(.segmented)
				}

				Section("Conversion result") {
					Text("\(conversionResult.formatted()) \(selectedOutputUnit.rawValue)")
				}
			}
			.navigationTitle("Lenght conversion")
		}
    }
}

#Preview {
    ContentView()
}
