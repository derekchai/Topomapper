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
                
                if route.waypoints.isEmpty {
                    ContentUnavailableView("No waypoints", image: "mappin.and.ellipse.badge.questionmark", description: Text("This Route has no waypoints. Press the Edit Route waypoints button to get started!"))
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
                        .chartXAxis {
                            AxisMarks(format: .routeLength)
                        }
                        .chartYAxis {
                            AxisMarks(format: .elevation)
                        }
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
