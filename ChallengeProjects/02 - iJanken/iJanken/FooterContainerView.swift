//
//  FooterContainerView.swift
//  iJanken
//
//  Created by João Pedro Mata on 09/05/24.
//

import SwiftUI

struct FooterContainerView: View {
	let score: Int
	let round: Int

	var body: some View {
		VStack {
			Text("Score: \(score)")
				.font(.headline.bold())
			Text("(\(10 - round) attempts remaining)")
				.font(.subheadline.weight(.regular))
		}
		.foregroundStyle(.secondary)
		.multilineTextAlignment(.center)
		.padding(15)
		.clipShape(.rect(cornerRadius: 10))

	}
}

#Preview {
	FooterContainerView(score: 10, round: 5)
}
