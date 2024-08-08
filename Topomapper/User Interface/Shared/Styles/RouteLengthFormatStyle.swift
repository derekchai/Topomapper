//
//  RouteLengthFormatStyle.swift
//  Topomapper
//
//  Created by Derek Chai on 08/08/2024.
//

import Foundation
import CoreLocation

struct RouteLengthFormatStyle: FormatStyle {
    typealias FormatInput = CLLocationDistance
    typealias FormatOutput = String
    
    func format(_ value: CLLocationDistance) -> String {
        Measurement(value: value, unit: UnitLength.meters)
            .formatted(routeLengthFormatStyle)
    }
}

extension FormatStyle where Self == RouteLengthFormatStyle {
    /// A style for formatting the length of a `Route`.
    static var routeLength: Self { Self() }
}

private let routeLengthFormatStyle = Measurement<UnitLength>.FormatStyle(
    width: .abbreviated,
    usage: .road,
    numberFormatStyle: .number.precision(.fractionLength(1...1))
)

