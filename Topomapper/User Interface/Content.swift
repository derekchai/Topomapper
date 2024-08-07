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
        Text("Content")
            .navigationTitle(route.name)
    }
}

// MARK: - Preview
#Preview {
//    Content()
}
