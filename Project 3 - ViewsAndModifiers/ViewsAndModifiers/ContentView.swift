//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by João Pedro Mata on 08/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		Button("Hello, world!") {
			print(type(of: self.body))
		}
		.background(.red)
		.frame(width: 200, height: 200)
		.background(.yellow)
    }
}

#Preview {
    ContentView()
}
