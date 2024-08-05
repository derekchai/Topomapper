//
//  Detail.swift
//  Topomapper
//
//  Created by Derek Chai on 05/08/2024.
//

import SwiftUI
import MapKit

struct Detail: View {
    
    // MARK: - Body
    var body: some View {
        Map()
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("New Route", systemImage: "plus", action: {})
                }
            }
    }
}

// MARK: - Preview
#Preview {
    Detail()
}
