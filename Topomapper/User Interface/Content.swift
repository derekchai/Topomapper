//
//  Content.swift
//  Topomapper
//
//  Created by Derek Chai on 05/08/2024.
//

import SwiftUI
import Charts

struct Content: View {
    // MARK: - Exposed Properties
    let route: Route
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                if let description = route.userDescription {
                    Text(description)
                }
                
                Text("\(route.waypoints.count) waypoints")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                
                if #available(macOS 15.0, *) {
                    Chart {
                        LinePlot(
                            route.waypoints,
                            x:
                                    .value(
                                        "Distance from start",
                                        \.distanceFromStart
                                    ),
                            y: .value("Elevation", \.elevation)
                        )
                    }
                }
            }
        }
        .navigationTitle(route.name)
    }
}

// MARK: - Preview
#Preview {
    Content(route: Route.angelusHut)
}
