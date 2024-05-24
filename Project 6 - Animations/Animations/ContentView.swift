//
//  ContentView.swift
//  Animations
//
//  Created by João Pedro Mata on 23/05/24.
//

import SwiftUI

struct ContentView: View {
	@State private var buttonColor = Color.red

    var body: some View {
		Button("My Button") {
			buttonColor = .blue
		}
		.padding(20)
		.background(buttonColor)
		.foregroundStyle(.white)
		.animation(.default, value: buttonColor)
    }
}

#Preview {
    ContentView()
}
