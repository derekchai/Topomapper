//
//  EditRoutePathCard.swift
//  Topomapper
//
//  Created by Derek Chai on 09/08/2024.
//

import SwiftUI

struct EditRoutePathCard: View {
    
    // MARK: - Exposed Properties
    @Binding var route: Route
    
    var onDidPressCloseButton = {}
    
    // MARK: - Body
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Button(action: self.onDidPressCloseButton) {
                    Image(systemName: "xmark.circle.fill")
                }
                .buttonStyle(.plain)
            
                Text("Edit Route path")
                    .font(.headline)
            }
        }
            .padding()  // Interior padding
            .background(.ultraThickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(radius: 16)
            .padding()  // Exterior padding
            .transition(.move(edge: .trailing))
            .zIndex(1)
    }
}

// MARK: - Preview
#Preview {
    EditRoutePathCard(route: .constant(Route.angelusHut))
}
