//
//  ElevationFormatStyle.swift
//  Topomapper
//
//  Created by Derek Chai on 08/08/2024.
//

import Foundation
import CoreLocation

struct ElevationFormatStyle: FormatStyle {
    typealias FormatInput = CLLocationDistance
    typealias FormatOutput = String
    
    func format(_ value: CLLocationDistance) -> String {
        Measurement(value: value, unit: UnitLength.meters)
            .formatted(elevationFormatStyle)
    }
}

extension FormatStyle where Self == ElevationFormatStyle {
    /// A style for formatting elevation, or cumulative elevation gain/losss.
    static var elevation: Self { Self() }
}

private let elevationFormatStyle = Measurement<UnitLength>.FormatStyle(
    width: .abbreviated,
    usage: .asProvided,
    numberFormatStyle: .number.precision(.fractionLength(0...0))
)
