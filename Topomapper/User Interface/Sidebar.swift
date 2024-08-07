//
//  Sidebar.swift
//  Topomapper
//
//  Created by Derek Chai on 05/08/2024.
//

import SwiftUI
import SwiftData

struct Sidebar: View {
    @Query(sort: \Route.creationDate) private var userRoutes: [Route]
    
    // MARK: - Body
    var body: some View {
        List {
            Section("My Routes") {
                ForEach(userRoutes) { route in
                    NavigationLink {
                        Text(route.name)
                    } label: {
                        TextField("Title key", text: Bindable(route).name)
                    }
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    Sidebar()
        .modelContainer(DataController.previewModelContainer)
}
