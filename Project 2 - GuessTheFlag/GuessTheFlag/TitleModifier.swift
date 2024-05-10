//
//  TitleModifier.swift
//  GuessTheFlag
//
//  Created by João Pedro Mata on 09/05/24.
//

import SwiftUI

//struct Title: ViewModifier {
	
//	func body(content: Content) -> some View {
//		content
//			.font(.largeTitle)
//			.foregroundStyle(.white)
//			.padding()
//			.background(.blue)
//			.clipShape(.rect(cornerRadius: 10))
//	}
//}

struct CustomTitle: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.largeTitle.bold())
			.foregroundStyle(.white)
	}
}

extension View {
	func titleStyle() -> some View {
		modifier(CustomTitle())
	}
}
