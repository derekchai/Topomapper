//
//  RoutePathEditingView.swift
//  Topomapper
//
//  Created by Derek Chai on 19/08/2024.
//

import SwiftUI

struct RoutePathEditingView: View {
    // MARK: - Exposed Properties
    @Binding var route: Route
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            List {
                Section("Stops") {
                    ForEach($route.stops, id: \.self, editActions: .all) { stop in
                        StopListItem(stop: stop.wrappedValue.description)
                            .listRowSeparator(.hidden)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            
            Label("Tap on the map to add a stop", systemImage: "plus.circle.fill")
                .foregroundStyle(.secondary)
                .padding()
        }
        .navigationTitle("\(route.name) — Editing Path")
        .background(.background)
    }
}

// MARK: - Preview
#Preview {
    RoutePathEditingView(route: .constant(Route.angelusHut))
}
