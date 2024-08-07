//
//  ContentView.swift
//  Topomapper
//
//  Created by Derek Chai on 05/08/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // MARK: - Body
    var body: some View {
        NavigationSplitView {
            Sidebar()
        } content: {
            Content()
        } detail: {
            Detail()
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
        .modelContainer(DataController.previewModelContainer)
}
