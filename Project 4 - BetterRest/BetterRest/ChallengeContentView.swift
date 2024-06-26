//
//  ChallengeContentView.swift
//  BetterRest
//
//  Created by João Pedro Mata on 15/05/24.
//

import CoreML
import SwiftUI

struct ContentView: View {

	@State private var wakeUp = defaultWakeTime
	@State private var sleepAmount = 8.0
	@State private var coffeeAmount = 1

	@State private var alertTitle = ""
	@State private var alertMessage = ""
	@State private var showingAlert = false

	static var defaultWakeTime: Date {
		var components = DateComponents()
		components.hour = 7
		components.minute = 0
		return Calendar.current.date(from: components) ?? .now
	}

	private var calculateBedTime: String {
		do {
			let config = MLModelConfiguration()
			let model = try SleepCalculator(configuration: config)

			let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
			let hour = (components.hour ?? 0) * 60 * 60
			let minute = (components.minute ?? 0) * 60

			let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

			let sleepTime = wakeUp - prediction.actualSleep

			return sleepTime.formatted(date: .omitted, time: .shortened)
		} catch {
			return "Sorry, that was a problem calculating your bedtime."
		}

	}

	var body: some View {
		NavigationStack {
			Form {
				Section("When do you want to wake up?") {
					DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
						.labelsHidden()
				}

				Section("Desired amount of sleep") {
					Stepper("\(sleepAmount.formatted())", value: $sleepAmount, in: 4...12, step: 0.25)
				}


				Section("Daily coffee intake") {
					Picker("Number of Cups", selection: $coffeeAmount) {
						ForEach(4...12, id: \.self) {
							Text("\($0)")
						}
					}
				}

				Section("recommended bedtime") {
					Text(calculateBedTime)
						.font(.largeTitle)
				}
			}
			.navigationTitle("BetterRest")
			.alert(alertTitle, isPresented: $showingAlert) {
				Button("OK") { }
			} message: {
				Text(alertMessage)
			}
		}
	}
}

#Preview {
	ContentView()
}
