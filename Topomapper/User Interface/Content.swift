//
//  Content.swift
//  Topomapper
//
//  Created by Derek Chai on 05/08/2024.
//

import SwiftUI

struct Content: View {
    // MARK: - Exposed Properties
    let route: Route
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("\(route.waypoints.count) waypoints")
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
