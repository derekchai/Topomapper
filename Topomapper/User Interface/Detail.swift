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
                    Button("Edit Route path", systemImage: "point.topright.arrow.triangle.backward.to.point.bottomleft.scurvepath", action: {})
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
        Image(systemName: "point.topright.arrow.triangle.backward.to.point.bottomleft.scurvepath")
    }
}

// MARK: - Preview
#Preview {
    Detail()
}
