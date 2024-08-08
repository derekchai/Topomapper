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
    @State private var isShowingDeleteRouteAlert: Bool = false
    
    // MARK: - Body
    var body: some View {
        List(selection: $selectedRoute) {
            Section("My Routes") {
                ForEach(userRoutes) { route in
                    NavigationLink(value: route) {
                        TextField("Route name", text: Bindable(route).name)
                    }
                    .contextMenu {
                        Button(
                            "Delete Route",
                            role: .destructive,
                            action: showDeleteRouteAlert
                        )
                    }
                    .confirmationDialog(
                        "Are you sure you want to delete this Route?",
                        isPresented: $isShowingDeleteRouteAlert
                    ) {
                        Button(
                            "Delete",
                            role: .destructive,
                            action: {deleteRoute(route)})
                    } message: {
                        Text("This action is irreversible.")
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("New Route", systemImage: "plus", action: createNewRoute)
            }
        } // toolbar
        .onAppear {
            if let firstRoute = userRoutes.first {
                selectedRoute = firstRoute
            }
        }
    } // body
}

// MARK: - Actions
extension Sidebar {
    /// Creates a new empty ``Route`` and inserts it into the model context.
    private func createNewRoute() {
        let newRoute = Route(
            name: "New Route",
            creationDate: Date(),
            userDescription: "",
            waypoints: []
        )
        modelContext.insert(newRoute)
        
        // Ensure userRoutes is updated before setting selectedRoute.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
            selectedRoute = newRoute
        }
    }
    
    /// Deletes the currently selected ``Route`` from the model context.
    private func deleteSelectedRoute() {
        if let selectedRoute {
            modelContext.delete(selectedRoute)
        }
    }
    
    /// Deletes the given ``Route`` from the model context.
    /// - Parameter route: The ``Route`` to delete.
    private func deleteRoute(_ route: Route) {
        withAnimation {
            modelContext.delete(route)
        }
    }
    
    /// Show the ``Route`` deletion confirmation alert.
    private func showDeleteRouteAlert() {
        isShowingDeleteRouteAlert = true
    }
}

// MARK: - Preview
#Preview {
    Sidebar(
        selectedRoute: .constant(Route(name: "My ROute", creationDate: Date(), waypoints: []))
    )
    .modelContainer(DataController.previewModelContainer)
}
