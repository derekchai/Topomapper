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
    
    // MARK: - Exposed Properties
    @Binding var route: Route
    @Binding var isEditingRoutePath: Bool
    
    // MARK: - Internal Properties
    /// Whether ``RouteDetailView`` is showing the Edit Route path card.
    @State private var isShowingEditRoutePathCard: Bool = false
    
    private let editRoutePathTip = EditRoutePathTip()
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .topTrailing) {
            RouteMapViewControllerRepresentable(stops: $route.stops)
                .toolbar {
                    ToolbarItem {
                        Toggle(
                            isOn: $isEditingRoutePath
                                .animation()
                        ) {
                            Label("Edit Route path", image: "path.edit")
                        }
                    }
                }
            
            if isShowingEditRoutePathCard {
                EditRoutePathCard(
                    route: $route,
                    onDidPressCloseButton: hideEditRoutePathCard
                )
            }
        } // ZStack
    }
}

// MARK: - Actions
extension RouteDetailView {
    private func hideEditRoutePathCard() {
        withAnimation {
            isShowingEditRoutePathCard = false
        }
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
    RouteDetailView(
        route: .constant(Route.angelusHut),
        isEditingRoutePath: .constant(false)
    )
}
