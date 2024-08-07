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
    @Binding var route: Route
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
                Section("Description") {
                    TextField(
                        "Description",
                        text: $route.userDescription,
                        prompt: Text("Enter a description for this Route"),
                        axis: .vertical
                    )
                }
                
                if #available(macOS 15.0, *) {
                    Section("Elevation Profile") {
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
                        .padding([.top, .bottom])
                    }
                }
                
                Text("\(route.waypoints.count) waypoints")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .navigationTitle(route.name)
    }
}

// MARK: - Preview
#Preview {
    Content(route: .constant(Route.angelusHut))
}
