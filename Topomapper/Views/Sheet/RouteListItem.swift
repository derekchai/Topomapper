//
//  RouteListItem.swift
//  Topomapper
//
//  Created by Derek Chai on 25/06/2024.
//

import SwiftUI

struct RouteListItem: View {
    
    
    // MARK: - Exposed Properties
    
    var route: Route
    
    var onItemTapGesture: (() -> Void)?
    
    
    // MARK: - Body
    
    var body: some View {
        Button {
            if let onItemTapGesture {
                onItemTapGesture()
            }
        } label: {
            HStack {
                VStack(alignment: .leading) {
                    Text(route.name)
                        .font(.headline)
                    
                    Text(
                        "\(route.length.meters.formatted(.routeLength))"
                    )
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                VStack {
                    Label(
                        "\(route.elevationGain.meters.formatted(.elevationChange))",
                        systemImage: "arrow.up.right"
                    )
                    
                    Label(
                        "\(route.elevationLoss.meters.formatted(.elevationChange))",
                        systemImage: "arrow.down.right"
                    )
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .labelStyle(.trailingIcon)
            }
        }  // Button label
        .foregroundStyle(.primary)
    }
}


// MARK: - Preview

//#Preview {
//    RouteListItem()
//}
