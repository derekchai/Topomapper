//
//  FeatureCollection.swift
//  Topomapper
//
//  Created by Derek Chai on 05/08/2024.
//

import Foundation
import CoreLocation

/// A model representing certain properties of a GeoJSON `FeatureCollection`
/// relevant to ``Topomapper``.
///
/// For more information about the GeoJSON standard, see the [GeoJSON Specification
/// (RFC 7946)](https://datatracker.ietf.org/doc/html/rfc7946).
struct GeoJSONFeatureCollection: Codable {
    let features: [Feature]
    
    struct Feature: Codable {
        let geometry: Geometry
        let properties: Properties
        
        struct Geometry: Codable {
            let coordinates: [[Double]]
        }
        
        struct Properties: Codable {
            let segments: [Segment]
            
            struct Segment: Codable {
                let steps: [Step]
                
                struct Step: Codable {
                    let distance: CLLocationDistance
                    let instruction: String
                    let name: String
                }
            }
        }
    }
}
