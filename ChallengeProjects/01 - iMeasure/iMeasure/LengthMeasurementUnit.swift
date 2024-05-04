//
//  LengthMeasurementUnit.swift
//  iMeasure
//
//  Created by João Pedro Mata on 04/05/24.
//

import Foundation

enum LenghtMeasurementUnit: String, CaseIterable {
	case cm
	case m
	case km
	case `in`
	case ft
	case yd

	var unit: UnitLength {
		switch self {
		case .cm:
			return .centimeters
		case .m:
			return .meters
		case .km:
			return .kilometers
		case .in:
			return .inches
		case .ft:
			return .feet
		case .yd:
			return .yards
		}
	}
}
