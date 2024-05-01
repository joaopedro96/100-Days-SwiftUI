//
//  ContentView.swift
//  WeSplit
//
//  Created by João Pedro Mata on 01/05/24.
//

import SwiftUI

struct ContentView: View {
	@State private var count = 0

	@State private var name = ""

	private let students = ["Harry", "Hermione", "Ron"]
	@State private var selectedStudent = "Harry"

    var body: some View {
		NavigationStack {
			Form{
				Section {
					Text("Select Best HP character")
					Picker("Select one", selection: $selectedStudent) {
						ForEach(students, id: \.self) { student in
							Text(student)
						}
					}
				}

				Section {
					ForEach(0..<5) {
						Text("New line number \($0)")
					}
				}

				Section {
					TextField("Set your name here", text: $name)
					Text("Name is \(name)")

					Button("Tap count \(count)") {
						count += 1
					}
				}

				Section {
					Text("This is a whole new section")
				}

				Section {
					Text("I did wrote some text here!")
					Text("I did wrote some text here!")
					Text("I did wrote some text here!")
					Text("I did wrote some text here!")
				}
			}
			.navigationTitle("SwiftUI")
		}
    }
}

#Preview {
    ContentView()
}
