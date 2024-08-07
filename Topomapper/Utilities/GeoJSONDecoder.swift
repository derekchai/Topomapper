//
//  GeoJSONDecoder.swift
//  Topomapper
//
//  Created by Derek Chai on 07/08/2024.
//

import Foundation

class GeoJSONDecoder {
    /// Decodes a GeoJSON object into a ``FeatureCollection``.
    /// - Parameter data: The GeoJSON object to decode.
    /// - Returns: The decoded ``FeatureCollection``.
    func decode(_ data: Data) -> FeatureCollection? {
        do {
            let geoJSON = try JSONDecoder().decode(FeatureCollection.self, from: data)
            return geoJSON
        } catch {
            return nil
        }
    }
}
