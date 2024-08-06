//
//  Sidebar.swift
//  Topomapper
//
//  Created by Derek Chai on 05/08/2024.
//

import SwiftUI

struct Sidebar: View {
    @State private var routes = [
        Route(name: "Route A", creationDate: Date(), waypoints: []),
        Route(name: "Route B", creationDate: Date(), waypoints: []),
        Route(name: "Route C", creationDate: Date(), waypoints: []),
    ]
    
    // MARK: - Body
    var body: some View {
        List {
            Section("My Routes") {
                ForEach($routes, id: \.self, editActions: .move) { $route in
                    NavigationLink {
                        Text("Destination \(route)")
                    } label: {
                        TextField(text: $route.name) {}
                    }
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    Sidebar()
}
