//
//  ContentView.swift
//  iExpense
//
//  Created by João Pedro Mata on 06/06/24.
//

import SwiftUI

struct SecondView: View {
	@Environment(\.dismiss) var dismiss
	let name: String

	var body: some View {
		Text("Hello, \(name)!")
		Button("dismiss") {
			dismiss()
		}
	}
}

struct OldContentView: View {
	@State private var showingSheet = false

    var body: some View {
		Button("Show sheet") {
			showingSheet.toggle()
		}
		.sheet(isPresented: $showingSheet) {
			SecondView(name: "John")
		}
    }
}

#Preview {
    OldContentView()
}
