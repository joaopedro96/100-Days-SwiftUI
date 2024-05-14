//
//  ContentView.swift
//  BetterRest
//
//  Created by João Pedro Mata on 13/05/24.
//

import SwiftUI

struct ContentView: View {

	@State private var sleepAmount = 8.0
	@State private var wakeUp = Date.now

    var body: some View {
		Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
		DatePicker("Choose a date", selection: $wakeUp, in: Date.now...)
			.labelsHidden()
    }
}

#Preview {
    ContentView()
}
