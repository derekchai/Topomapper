//
//  Route.swift
//  Topomapper
//
//  Created by Derek Chai on 05/08/2024.
//

import Foundation
import SwiftData
import CoreLocation

/// A model representing a user-created route on ``Topomapper``.
@Model class Route {
    // MARK: - Properties
    /// The name of this ``Route``.
    var name: String
    
    /// The ``Date`` on which this ``Route`` was created.
    var creationDate: Date
    
    /// An optional description for this ``Route``.
    var userDescription: String?
    
    /// An array of ``Waypoint``s representing the path which
    /// this ``Route`` takes.
    var waypoints: [Waypoint]
    
    // MARK: - Initializer
    init(
        name: String,
        creationDate: Date,
        userDescription: String? = nil,
        waypoints: [Waypoint]
    ) {
        self.name = name
        self.creationDate = creationDate
        self.userDescription = userDescription
        self.waypoints = waypoints
    }
}
