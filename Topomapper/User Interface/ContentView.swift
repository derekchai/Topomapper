//
//  ContentView.swift
//  Topomapper
//
//  Created by Derek Chai on 05/08/2024.
//

import SwiftUI
import SwiftData
import MapKit

struct ContentView: View {
    
    // MARK: - Body
    var body: some View {
        NavigationSplitView {
            Sidebar()
        } detail: {
            Map()
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
