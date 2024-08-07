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
    }
}

// MARK: - Preview
#Preview {
    Sidebar(
        selectedRoute: .constant(Route(name: "My ROute", creationDate: Date(), waypoints: []))
    )
        .modelContainer(DataController.previewModelContainer)
}
