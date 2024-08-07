//
//  Route+SampleData.swift
//  Topomapper
//
//  Created by Derek Chai on 07/08/2024.
//

import Foundation
import MapKit

extension Route {
    static var angelusHut: Route {
        let url = Bundle.main.url(forResource: "AngelusHut", withExtension: "geojson")!
        let data = try! Data(contentsOf: url)
        
        let decoder = GeoJSONDecoder()
        let geoJSON = decoder.decode(data)!
        
        return Route(
            name: "St. Arnaud to Angelus Hut",
            creationDate: Date(),
            userDescription: "A hike from the town of St. Arnaud to Angelus Hut via the Cascade Route.",
            waypoints: geoJSON.features.first!.geometry.coordinates.map {
                Waypoint(
                    coordinate: CLLocationCoordinate2D(latitude: $0[1], longitude: $0[0]),
                    grade: 0,
                    elevation: $0[2],
                    distanceFromStart: 0
                )
            }
        )
    }
}
