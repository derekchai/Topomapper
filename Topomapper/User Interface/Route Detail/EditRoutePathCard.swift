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
    
    /// This closure is called when the 'Close' button of the view is pressed.
    var onDidPressCloseButton = {}
    
    // MARK: - Private Properties
    @State private var stops = ["Stop A", "Stop B", "Stop C"]
    
    // MARK: - Body
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Button(action: self.onDidPressCloseButton) {
                    Image(systemName: "xmark.circle.fill")
                }
                .buttonStyle(.plain)
            
                Spacer()
                
                Text("Edit Route path")
                    .font(.headline)
            } // HStack
            
            List {
                ForEach($stops, id: \.self, editActions: .all) { stop in
                    HStack {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundStyle(.tertiary)
                        
                        Text(stop.wrappedValue)
                        
                        Spacer()
                        
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.tertiary)
                    }
                    .listRowSeparatorTint(.secondary.opacity(0.3))
                }
                
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.blue)
                    
                    Text("Tap on the map to add a stop")
                        .foregroundStyle(.tertiary)
                    
                    Spacer()
                }
                .listRowSeparatorTint(.secondary.opacity(0.3))
            }
            .background(.quinary)
            .scrollContentBackground(.hidden)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.top)
        }
            .frame(maxWidth: 200)
            .padding()  // Interior padding
            .background(.thickMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(radius: 16)
            .padding()  // Exterior padding
            .transition(.move(edge: .trailing))
            .zIndex(1)
    }
}

// MARK: - Preview
#Preview {
    let route = Route(
        name: "My Route",
        creationDate: Date(),
        userDescription: "My Route description",
        waypoints: []
    )
    
    EditRoutePathCard(route: .constant(route))
}
