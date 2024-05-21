//
//  ContentView.swift
//  WordScramble
//
//  Created by João Pedro Mata on 20/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }

	func testBundle() {
		guard let fileUrl = Bundle.main.url(forResource: "file", withExtension: "txt"),
			  let fileContent = try? String(contentsOf: fileUrl) else { return }
	}
}

#Preview {
    ContentView()
}
