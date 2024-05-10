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

	@State private var round = 0
	@State private var showGameOver = false

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
					.titleStyle()

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
							FlagImage(imageName: countries[index].rawValue)
						}
					}
				}
				.frame(maxWidth: .infinity)
				.padding(20)
				.background(.regularMaterial)
				.clipShape(.rect(cornerRadius: 20))

				Spacer()

				Text("Score: \(score)")
					.foregroundStyle(.white)
					.font(.headline.bold())
					.multilineTextAlignment(.center)
				Text("(\(8 - round) attempts remaining)")
					.foregroundStyle(.white)
					.font(.subheadline.weight(.regular))
					.multilineTextAlignment(.center)
				Spacer()
			}
			.padding()
		}
		.alert("Game Over!\nYour score was \(score)/8.", isPresented: $showGameOver) {
			Button("Reset game", action: resetGame)
		}
		.alert(scoreTitle, isPresented: $showingScore) {
			Button("Continue", action: askNextQuestion)
		} message: {
			Text("Your score is \(score).")
		}
    }

	private func didTapFlag(with index: Int) {
		round += 1
		if (index == correctAnswerIndex) {
			scoreTitle = "Correct"
			score += 1
		} else {
			scoreTitle = "Wrong!\nThats the flag of \(countries[index].rawValue)"
		}

		showingScore = true
	}

	private func gameHasEnded() -> Bool {
		return (round >= 8)
	}

	private func askNextQuestion() {
		if gameHasEnded() {
			showGameOver = true
		} else {
			countries.shuffle()
			correctAnswerIndex = Int.random(in: 0...2)
		}
	}

	private func resetGame() {
		round = 0
		score = 0
		askNextQuestion()
	}
}

#Preview {
    ContentView()
}
