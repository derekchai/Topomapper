//
//  Sidebar.swift
//  Topomapper
//
//  Created by Derek Chai on 05/08/2024.
//

import SwiftUI
import SwiftData

struct Sidebar: View {
    // MARK: - Exposed Properties
    @Binding var selectedRoute: Route?
    
    // MARK: - Internal Properties
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Route.creationDate) private var userRoutes: [Route]
    
    // MARK: - Body
    var body: some View {
        List(selection: $selectedRoute) {
            Section("My Routes") {
                ForEach(userRoutes) { route in
                    NavigationLink(value: route) {
                        TextField("Route name", text: Bindable(route).name)
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .destructiveAction) {
                Button(
                    "Delete selected Route",
                    systemImage: "trash",
                    role: .destructive,
                    action: {
                    })
                .disabled(selectedRoute == nil)
            }
            ToolbarItem(placement: .primaryAction) {
                Button("New Route", systemImage: "plus", action: createNewRoute)
            }
        } // toolbar
        .onAppear {
            if let firstRoute = userRoutes.first {
                selectedRoute = firstRoute
            }
        }
    }
}

// MARK: - Actions
extension Sidebar {
    /// Creates a new empty ``Route`` and inserts it into the model context.
    private func createNewRoute() {
        let route = Route(
            name: "New Route",
            creationDate: Date(),
            userDescription: "",
            waypoints: []
        )
        modelContext.insert(route)
    }
}

// MARK: - Preview
#Preview {
    Sidebar(
        selectedRoute: .constant(Route(name: "My ROute", creationDate: Date(), waypoints: []))
    )
        .modelContainer(DataController.previewModelContainer)
}
