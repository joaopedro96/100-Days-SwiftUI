//
//  ContentViews.swift
//  GuessTheFlag
//
//  Created by João Pedro Mata on 05/05/24.
//

import SwiftUI

struct OldContentView: View {

	@State private var showingScore = false
	@State private var scoreTitle = ""

	@State private var countries = CountryFlags.allCases.shuffled()
	@State private var correctAnswerIndex = Int.random(in: 0...2)
	@State private var score = 0

	var body: some View {
		ZStack {
			LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
				.ignoresSafeArea()

			VStack(spacing: 30) {
				VStack {
					Text("Tap the flag of")
						.foregroundStyle(.white)
						.font(.subheadline.weight(.heavy))
					Text(countries[correctAnswerIndex].rawValue)
						.foregroundStyle(.white)
						.font(.largeTitle.weight(.bold))
				}

				ForEach(0..<3) { index in
					Button {
						didTapFlag(with: index)
					} label: {
						Image(countries[index].rawValue)
							.clipShape(.buttonBorder)
							.shadow(radius: 5)
					}
				}
			}
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

