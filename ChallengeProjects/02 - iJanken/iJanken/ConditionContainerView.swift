//
//  ConditionContainerView.swift
//  iJanken
//
//  Created by João Pedro Mata on 09/05/24.
//

import SwiftUI

struct ConditionContainerView: View {

	let winCondition: Bool
	private let winText = "Beat iJanken App"
	private let looseText = "Lose the game"

    var body: some View {
		VStack {
			Text("Win condition")
				.foregroundStyle(.secondary)
				.font(.title.bold())

			Text(winCondition ? winText : looseText)
				.foregroundStyle(winCondition ? .blue : .red)
				.font(.headline.weight(.heavy))
		}
    }
}

#Preview {
	ConditionContainerView(winCondition: Bool.random())
}
