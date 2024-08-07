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
            List {
                if let description = route.userDescription {
                    Text(description)
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
    Content(route: Route.angelusHut)
}
