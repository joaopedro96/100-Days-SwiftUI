//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by João Pedro Mata on 05/05/24.
//

import SwiftUI

struct ContentView: View {
	@State private var showAlert = false


    var body: some View {
		ZStack {
			VStack(spacing: 0) {
				Color.red
				Color.blue
			}

			Text("my new text")
				.foregroundStyle(.secondary)
				.padding(50)
				.background(.ultraThinMaterial)

		}
		.ignoresSafeArea()

//		Button("click me", action: buttonAction)

		Button(action: buttonAction) {
			Label("MyTitle", systemImage: "pencil")
				.padding(20)
				.foregroundStyle(.white)
				.background(.red)
		}
		.alert("Important tex", isPresented: $showAlert) {
			Button("OK") { }
		}

    }

	func buttonAction() {
		showAlert = true
	}
}

#Preview {
    ContentView()
}
