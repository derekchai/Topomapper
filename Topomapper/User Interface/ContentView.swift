//
//  ContentView.swift
//  Topomapper
//
//  Created by Derek Chai on 05/08/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // MARK: - Internal Properties
    @State private var selectedRoute: Route? = nil
    
    // MARK: - Body
    var body: some View {
        NavigationSplitView {
            RoutesSidebarView(selectedRoute: $selectedRoute)
        } content: {
            if selectedRoute != nil {
                RouteContentView(route: Binding($selectedRoute)!)
            } else {
                Text("No Route Selected")
            }
        } detail: {
            if selectedRoute != nil {
                RouteDetailView()
            } else {
                Text("No Route Selected")
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
        .modelContainer(DataController.previewModelContainer)
}
