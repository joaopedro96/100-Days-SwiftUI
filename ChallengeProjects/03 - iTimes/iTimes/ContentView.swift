//
//  ContentView.swift
//  iTimes
//
//  Created by João Pedro Mata on 28/05/24.
//

import SwiftUI

struct QuestionObject {
	let firstArg: Int
	let secondArg: Int
}

struct ContentView: View {

	private let availableQuestionsNumber = [5, 10, 20]
	@State private var selectedQuestionNumber = 5
	@State private var selectedTableMaxRange = 2
	@State private var isShowingQuestion = false
	@State private var inputResult = ""
	@State private var questionAtempt = 0
	@State private var score = 0
	@State private var isShowingScore = false

	private var questionList: [QuestionObject] {
		var computedList: [QuestionObject] = []
		for _ in 0...selectedQuestionNumber {
			let questionObject = QuestionObject(
				firstArg: Int.random(in: 2...selectedTableMaxRange),
				secondArg: Int.random(in: 0...9)
			)
			computedList.append(questionObject)
		}
		return computedList
	}

	var colorss: [Color] = [.red, .blue, .green]

	var body: some View {
		NavigationStack {
			List {
				Section("Number of questions") {
					Picker("Number of questions", selection: $selectedQuestionNumber) {
						ForEach(availableQuestionsNumber, id: \.self) {
							Text("\($0)")
						}
					}
					.pickerStyle(.segmented)
				}

				Section("Select a multiplication table") {
					Stepper("Up to \(selectedTableMaxRange)", value: $selectedTableMaxRange, in: 2...12)
				}

				Section("tEste") {
					Text("\(questionList[0].firstArg)")
				}
			}
			.navigationTitle("iTimes")
			.toolbar {
				Button("Play") {
					isShowingQuestion = true
				}
			}
			.alert("Question number: \(questionAtempt + 1)", isPresented: $isShowingQuestion) {
				TextField("Type the result", text: $inputResult)
					.keyboardType(.numberPad)
				Button("OK") {
					selectAnswer()
				}
			} message: {
				Text("\(questionList[questionAtempt].firstArg) x \(questionList[questionAtempt].secondArg)")
			}
			.alert("Your score is \(score)", isPresented: $isShowingScore) {

			}
		}
	}

	private func selectAnswer() {
		guard let typedResult = Int(inputResult) else { return }
		let question = questionList[questionAtempt]
		let mathResult = question.firstArg * question.secondArg
		if mathResult == typedResult {
			score += 1
		}
		questionAtempt += 1
		inputResult = ""
		if questionAtempt <= selectedQuestionNumber {
//			isShowingQuestion = true
			isShowingScore = true
		} else {
			isShowingScore = true
		}
	}
}

#Preview {
    ContentView()
}
