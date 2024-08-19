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
        
        let route = Route(
            from: geoJSON.features.first!.geometry,
            name: "St. Arnaud to Angelus Hut",
            creationDate: Date(),
            userDescription: "A hike from the town of St. Arnaud to Angelus Hut via the Cascade Route.",
            stops: []
        )
        
        route.stops = [
            route.waypoints.first!.coordinate,
            route.waypoints.last!.coordinate
        ]
        
        return route
    }
    
    static var tongariroCrossing: Route {
        let url = Bundle.main.url(forResource: "TongariroCrossing", withExtension: "geojson")!
        let data = try! Data(contentsOf: url)
        
        let decoder = GeoJSONDecoder()
        let geoJSON = decoder.decode(data)!
        
        let route = Route(
            from: geoJSON.features.first!.geometry,
            name: "Tongariro Alpine Crossing",
            creationDate: Date(),
            userDescription: "A moderately challenging day walk in UNESCO World Heritage Site Tongariro National Park.",
            stops: []
        )
        
        route.stops = [
            route.waypoints.first!.coordinate,
            route.waypoints.last!.coordinate
        ]
        
        return route
    }
}
