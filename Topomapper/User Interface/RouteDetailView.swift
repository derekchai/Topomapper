//
//  RouteDetailView.swift
//  Topomapper
//
//  Created by Derek Chai on 05/08/2024.
//

import SwiftUI
import MapKit
import TipKit

struct RouteDetailView: View {
    // MARK: - Internal Properties
    /// Whether ``RouteDetailView`` is showing the Edit Route path card.
    @State private var isShowingEditRoutePathCard: Bool = false
    
    private let editRoutePathTip = EditRoutePathTip()
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .topTrailing) {
            RouteMapViewControllerRepresentable()
                .toolbar {
                    ToolbarItem {
                        Toggle(isOn: $isShowingEditRoutePathCard.animation()) {
                            Label("Edit Route path", image: "path.edit")
                        }
                    }
                }
            
            if isShowingEditRoutePathCard {
                Text("Edit waypoints card")
                    .padding()  // Interior padding
                    .background(.ultraThickMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 16)
                    .padding()  // Exterior padding
                    .transition(.move(edge: .trailing))
            }
        } // ZStack
        .transition(.slide)
    }
}

struct EditRoutePathTip: Tip {
    var title: Text {
        Text("Edit Route path")
    }
    
    var message: Text? {
        Text("Click here to edit the path of this Route.")
    }
    
    var image: Image? {
        Image("path.edit")
    }
}

// MARK: - Preview
#Preview {
    RouteDetailView()
}
