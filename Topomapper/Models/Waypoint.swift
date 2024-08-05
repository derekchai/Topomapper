//
//  Waypoint.swift
//  Topomapper
//
//  Created by Derek Chai on 05/08/2024.
//

import Foundation
import CoreLocation

/// A model representing a point on a ``Route``.
struct Waypoint: Codable {
    /// The coordinate of this ``Waypoint``.
    var coordinate: CLLocationCoordinate2D
    
    /// The grade (percentage gradient) at this ``Waypoint`` on a ``Route``.
    var grade: Grade
    
    /// The elevation of this ``Waypoint``.
    var elevation: CLLocationDistance
    
    /// The distance from the start of the ``Route`` this ``Waypoint`` is located
    /// at.
    var distanceFromStart: CLLocationDistance
}
