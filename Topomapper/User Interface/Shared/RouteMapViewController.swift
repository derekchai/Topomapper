//
//  RouteMapViewController.swift
//  Topomapper
//
//  Created by Derek Chai on 06/08/2024.
//

import Foundation
import AppKit
import MapKit

class RouteMapViewController: NSViewController {
    let mapView = MKMapView()
    
    override func loadView() {
        mapView.showsCompass = true
        mapView.showsScale = true
        
        self.view = mapView
    }
}
