//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by João Pedro Mata on 09/05/24.
//

import SwiftUI

struct FlagImage: View {

	let imageName: String

	var body: some View {
		Image(imageName)
			.clipShape(.capsule)
			.shadow(radius: 5)
	}
}

#Preview {
	FlagImage(imageName: "US")
}
