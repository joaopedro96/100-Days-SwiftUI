//
//  JankenEnum.swift
//  iJanken
//
//  Created by João Pedro Mata on 10/05/24.
//

import Foundation

enum JankenEnum: String, CaseIterable {
	case scissors
	case rock
	case paper

	var name: String {
		switch self {
		case .scissors:
			return "✌️ Scissors ✌️"
		case .rock:
			return "👊 Rock 👊"
		case .paper:
			return "✋ Paper ✋"
		}
	}

	var icon: String {
		switch self {
		case .scissors:
			return "✌️"
		case .rock:
			return "👊"
		case .paper:
			return "✋"
		}
	}

	var beat: JankenEnum {
		switch self {
		case .scissors:
			return .paper
		case .rock:
			return .scissors
		case .paper:
			return .rock
		}
	}
}
