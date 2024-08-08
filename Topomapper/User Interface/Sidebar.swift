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
    @State private var routeToDelete: Route? = nil
    @FocusState private var focusedRoute: Route?
    
    // MARK: - Body
    var body: some View {
        List(selection: $selectedRoute) {
            Section("My Routes") {
                ForEach(userRoutes) { route in
                    NavigationLink(value: route) {
                        TextField("Route name", text: Bindable(route).name)
                            .focused($focusedRoute, equals: route)
                    }
                    .contextMenu {
                        Button(
                            "Delete Route",
                            role: .destructive,
                            action: {showDeleteRouteAlert(routeToDelete: route)}
                        )
                    }
                    .confirmationDialog(
                        "Are you sure you want to delete \(routeToDelete?.name ?? "this Route")?",
                        isPresented: $isShowingDeleteRouteAlert
                    ) {
                        Button(
                            "Delete",
                            role: .destructive,
                            action: deleteRoute
                        )
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
        focusedRoute = newRoute
        
        // Ensure userRoutes is updated before setting selectedRoute.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
            selectedRoute = newRoute
        }
    }
    
    /// Deletes the given ``Route`` from the model context.
    /// - Parameter route: The ``Route`` to delete.
    private func deleteRoute() {
        withAnimation {
            if let routeToDelete {
                modelContext.delete(routeToDelete)
            }
        }
    }
    
    /// Show the ``Route`` deletion confirmation alert.
    private func showDeleteRouteAlert(routeToDelete: Route) {
        isShowingDeleteRouteAlert = true
        self.routeToDelete = routeToDelete
    }
}

// MARK: - Preview
#Preview {
    Sidebar(
        selectedRoute: .constant(Route(name: "My ROute", creationDate: Date(), waypoints: []))
    )
    .modelContainer(DataController.previewModelContainer)
}
