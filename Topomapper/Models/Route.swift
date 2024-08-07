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

extension Route {
    /// Initializes a ``Route`` from ``GeoJSONFeatureCollection.Feature.Geometry``.
    ///
    /// This initializer calculates the distance from start and grade of each
    /// point.
    /// - Parameters:
    ///   - geometry: The GeoJSON geometry to create this ``Route`` from.
    ///   - name: The name of the ``Route``.
    ///   - creationDate: The creation date of the ``Route``.
    ///   - userDescription: An optional description of the ``Route``.
    convenience init(
        from geometry: GeoJSONFeatureCollection.Feature.Geometry,
        name: String,
        creationDate: Date,
        userDescription: String? = nil
    ) {
        let coordinates = geometry.coordinates
        
        var waypoints = [Waypoint]()
        var distanceFromStart: Double = 0
        
        // Add first coordinate to waypoints.
        waypoints
            .append(
                Waypoint(
                    coordinate: CLLocationCoordinate2D(
                        latitude: coordinates[0][1],
                        longitude: coordinates[0][0]
                    ),
                    grade: 0,
                    elevation: coordinates[0][2],
                    distanceFromStart: 0
                )
            )
        
        for i in 1..<geometry.coordinates.count {
            let previousCoordinate = coordinates[i - 1]
            let currentCoordinate = coordinates[i]
            
            let waypoint = Waypoint(
                coordinate: CLLocationCoordinate2D(
                    latitude: currentCoordinate[1],
                    longitude: currentCoordinate[0]
                ),
                grade: 0,
                elevation: currentCoordinate[2],
                distanceFromStart: distanceFromStart
            )
            
            waypoints.append(waypoint)
            
            let previousLocation = CLLocation(
                latitude: previousCoordinate[1],
                longitude: previousCoordinate[0]
            )
            
            let currentLocation = CLLocation(
                latitude: currentCoordinate[1],
                longitude: currentCoordinate[0]
            )
            
            distanceFromStart += previousLocation
                .distance(from: currentLocation)
        }
        
        self.init(
            name: name,
            creationDate: creationDate,
            userDescription: userDescription,
            waypoints: waypoints
        )
    }
}
