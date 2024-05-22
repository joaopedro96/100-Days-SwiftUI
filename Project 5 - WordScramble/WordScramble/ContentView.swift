//
//  ContentView.swift
//  WordScramble
//
//  Created by João Pedro Mata on 20/05/24.
//

import SwiftUI

struct ContentView: View {
	@State private var rootWord = ""
	@State private var newWord = ""
	@State private var usedWord = [String]()

	@State private var errorTitle = ""
	@State private var errorMessage = ""
	@State private var showingError = false

    var body: some View {
		NavigationStack {
			List {
				Section {
					TextField("Enter your word", text: $newWord)
						.textInputAutocapitalization(.never)
				}

				Section {
					ForEach(usedWord, id: \.self) { word in
						HStack {
							Image(systemName: "\(word.count).circle")
							Text(word)
						}
					}
				}
			}
			.navigationTitle(rootWord)
			.onSubmit(addNewWord)
			.onAppear(perform: startGame)
			.alert(errorTitle, isPresented: $showingError) { } message: {
				Text(errorMessage)
			}
		}
    }

	func addNewWord() {
		let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

		guard answer.count > 0 else { return }

		guard isOriginal(word: answer) else {
			wordError(title: "Word used already", message: "Be more original!")
			return
		}

		guard isPossible(word: answer) else {
			wordError(title: "Word not possible", message: "You cant spell that word from '\(rootWord)'!")
			return
		}

		guard isReal(word: answer) else {
			wordError(title: "Word not recognized", message: "You cant just make then up, you know!")
			return
		}


		withAnimation {
			usedWord.insert(answer, at: 0)
		}
		newWord = ""
	}

	func startGame() {
		guard let fileURL = Bundle.main.url(forResource: "start", withExtension: "txt"),
			  let fileContent = try? String(contentsOf: fileURL),
			  let randomWord = fileContent.components(separatedBy: "\n").randomElement() else {
			fatalError("could not load file")
		}

		rootWord = randomWord
	}

	func isOriginal(word: String) -> Bool {
		return !usedWord.contains(word)
	}

	func isPossible(word: String) -> Bool {
		var tempWord = rootWord

		for letter in word {
			if let pos = tempWord.firstIndex(of: letter) {
				tempWord.remove(at: pos)
			} else {
				return false
			}
		}

		return true
	}

	func isReal(word: String) -> Bool {
		let checker = UITextChecker()
		let range = NSRange(location: 0, length: word.utf16.count)
		let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
		return misspelledRange.location == NSNotFound
	}

	func wordError(title: String, message: String) {
		errorTitle = title
		errorMessage = message
		showingError = true
	}
}

#Preview {
    ContentView()
}
