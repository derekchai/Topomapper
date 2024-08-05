//
//  Sidebar.swift
//  Topomapper
//
//  Created by Derek Chai on 05/08/2024.
//

import SwiftUI

struct Sidebar: View {
    
    // MARK: - Body
    var body: some View {
        List {
            Section("My Routes") {
                ForEach(0..<20, id: \.self) { number in
                    Text("Route \(number)")
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    Sidebar()
}
