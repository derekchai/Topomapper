//
//  Detail.swift
//  Topomapper
//
//  Created by Derek Chai on 05/08/2024.
//

import SwiftUI
import MapKit
import TipKit

struct Detail: View {
    private let editRoutePathTip = EditRoutePathTip()
    
    // MARK: - Body
    var body: some View {
        RouteMapViewControllerRepresentable()
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(
                        action: {},
                        label: {
                            Label("Edit Route path", image: "path.edit")
                        }
                    )
                    .popoverTip(editRoutePathTip, arrowEdge: .bottom)
                }
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
    Detail()
}
