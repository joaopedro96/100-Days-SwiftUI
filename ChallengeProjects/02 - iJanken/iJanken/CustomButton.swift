//
//  CustomButton.swift
//  iJanken
//
//  Created by João Pedro Mata on 09/05/24.
//

import SwiftUI

struct CustomButton: View {

	let buttonTitle: String
	let buttonAction: () -> Void

    var body: some View {
        Button(buttonTitle, action: buttonAction)
			.frame(minWidth: 200)
			.foregroundStyle(.white)
			.padding(20)
			.background(.black)
			.font(.system(size: 30))
			.clipShape(.rect(cornerRadius: 20))
			.shadow(radius: 10)
    }
}

#Preview {
	CustomButton(buttonTitle: "👊 Preview", buttonAction: { })
}
