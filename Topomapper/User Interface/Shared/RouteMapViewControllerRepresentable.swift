//
//  RouteMapViewControllerRepresentable.swift
//  Topomapper
//
//  Created by Derek Chai on 06/08/2024.
//

import Foundation
import AppKit
import SwiftUI

struct RouteMapViewControllerRepresentable: NSViewControllerRepresentable {
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
