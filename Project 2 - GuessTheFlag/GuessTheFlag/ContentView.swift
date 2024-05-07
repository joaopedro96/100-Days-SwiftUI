//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by João Pedro Mata on 05/05/24.
//

import SwiftUI

struct ContentView: View {

	@State private var showingScore = false
	@State private var scoreTitle = ""

	@State private var countries = CountryFlags.allCases.shuffled()
	@State private var correctAnswerIndex = Int.random(in: 0...2)
	@State private var score = 0


	private let customBlue: Color = .init(red: 0.1, green: 0.2, blue: 0.45)
	private let customRed: Color = .init(red: 0.76, green: 0.15, blue: 0.26)

    var body: some View {
		ZStack {

			RadialGradient(stops: [
				.init(color: customBlue, location: 0.3),
				.init(color: customRed, location: 0.3)
			], center: .top, startRadius: 200, endRadius: 700)
			.ignoresSafeArea()

			VStack {
				Spacer()
				Text("Guess the Flag")
					.font(.largeTitle.bold())
					.foregroundStyle(.white)

				VStack(spacing: 15) {
					VStack {
						Text("Tap the flag of")
							.foregroundStyle(.secondary)
							.font(.subheadline.weight(.heavy))
						Text(countries[correctAnswerIndex].rawValue)
							.font(.largeTitle.weight(.semibold))
					}

					ForEach(0..<3) { index in
						Button {
							didTapFlag(with: index)
						} label: {
							Image(countries[index].rawValue)
								.clipShape(.capsule)
								.shadow(radius: 5)
						}
					}
				}
				.frame(maxWidth: .infinity)
				.padding(20)
				.background(.regularMaterial)
				.clipShape(.rect(cornerRadius: 20))

				Spacer()
				Spacer()

				Text("Score: \(score)")
					.foregroundStyle(.white)
					.font(.headline.bold())
				Spacer()
			}
			.padding()
		}
		.alert(scoreTitle, isPresented: $showingScore) {
			Button("Continue", action: askNextQuestion)
		} message: {
			Text("Your score is \(score)")
		}
    }

	private func didTapFlag(with index: Int) {
		if (index == correctAnswerIndex) {
			scoreTitle = "Correct"
			score += 1
		} else {
			scoreTitle = "Wrong"
		}

		showingScore = true
	}

	private func askNextQuestion() {
		countries.shuffle()
		correctAnswerIndex = Int.random(in: 0...2)
	}
}

#Preview {
    ContentView()
}
