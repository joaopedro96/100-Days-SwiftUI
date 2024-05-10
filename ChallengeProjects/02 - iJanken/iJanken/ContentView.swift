//
//  ContentView.swift
//  iJanken
//
//  Created by João Pedro Mata on 09/05/24.
//

import SwiftUI

struct ContentView: View {

	private let jankenOptions = JankenEnum.allCases

	@State private var score = 0
	@State private var round = 0
	@State private var beatApp = Bool.random()
	@State private var appSelectedJanken = JankenEnum.allCases.randomElement() ?? .paper

    var body: some View {
		ZStack {
			LinearGradient(colors: [.orange, .yellow], startPoint: .top, endPoint: .bottom)
				.ignoresSafeArea()

			VStack {

				Spacer()
				Spacer()

				ConditionContainerView(winCondition: beatApp)
				Spacer()
				Spacer()
				VStack(alignment: .leading) {
					Text("App played:")
					Text(appSelectedJanken.icon)
						.frame(width: 200)
						.padding(10)
						.background(.ultraThinMaterial)
						.font(.system(size: 100))
						.clipShape(.buttonBorder)
				}

				Spacer()
				Spacer()

				VStack(alignment: .leading, spacing: 20) {
					Text("You play:")
					ForEach(jankenOptions, id: \.self) { janken in
						CustomButton(buttonTitle: janken.name) {
							doThis(with: janken)
						}
					}
				}

				FooterContainerView(score: score, round: round)
			}
		}
    }

	private func doThis(with selectedJanken: JankenEnum) {
		beatApp.toggle()
		appSelectedJanken = JankenEnum.allCases.randomElement() ?? .paper
	}
}

#Preview {
    ContentView()
}
