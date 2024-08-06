//
//  Sidebar.swift
//  Topomapper
//
//  Created by Derek Chai on 05/08/2024.
//

import SwiftUI

struct Sidebar: View {
    @State private var numbers = [1,2,3,4,5,6]
    
    // MARK: - Body
    var body: some View {
        List {
            Section("My Routes") {
                ForEach($numbers, id: \.self, editActions: .move) { number in
                    Text("Route \(number.wrappedValue)")
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    Sidebar()
}
