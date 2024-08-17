//
//  RouteMapViewControllerRepresentable.swift
//  Topomapper
//
//  Created by Derek Chai on 06/08/2024.
//

import Foundation
import AppKit
import SwiftUI
import CoreLocation

struct RouteMapViewControllerRepresentable: NSViewControllerRepresentable {
    
    // MARK: - Exposed Properties
    @Binding var stops: [CLLocationCoordinate2D]
    
    func makeNSViewController(context: Context) -> RouteMapViewController {
        RouteMapViewController()
    }

    func updateNSViewController(
        _ nsViewController: RouteMapViewController,
        context: Context
    ) {
        // Update code
    }
}
