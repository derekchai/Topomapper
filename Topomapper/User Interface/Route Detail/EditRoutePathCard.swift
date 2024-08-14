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
    @State private var draggedStop: String?

    
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
            .padding(.bottom)
            
            ForEach($stops, id: \.self, editActions: .all) { stop in
                StopListItem(stop: stop.wrappedValue)
                    .scaleEffect(draggedStop == stop.wrappedValue ? 1.1 : 1)
                    .onDrag {
                        withAnimation {
                            draggedStop = stop.wrappedValue
                        }

                        return NSItemProvider(object: stop.wrappedValue as NSString)
                    } preview: {
                        Color.clear
                    }
                    .onDrop(
                        of: [.text],
                        delegate: StopListItemDropDelegate(
                            stops: $stops,
                            draggedStop: $draggedStop,
                            destinationStop: stop.wrappedValue
                        )
                    )
            }
            
            HStack {
                Image(systemName: "plus.circle.fill")
                    .foregroundStyle(.blue)
                
                Text("Tap on the map to add a stop")
                    .foregroundStyle(.tertiary)
                
            }
            .padding(.top)
        } // VStack
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

struct StopListItemDropDelegate: DropDelegate {
    @Binding var stops: [String]
    @Binding var draggedStop: String?
    let destinationStop: String
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        withAnimation {
            draggedStop = nil
        }
        
        return true
    }
    
    func dropEntered(info: DropInfo) {
        guard let draggedStop else { return }
        
        guard let sourceIndex = stops.firstIndex(of: draggedStop) else { return }
        
        guard let destinationIndex = stops.firstIndex(of: destinationStop) else { return }
        
        guard sourceIndex != destinationIndex else { return }
        
        withAnimation {
            let destinationOffset: Int
            
            if destinationIndex > sourceIndex {
                destinationOffset = destinationIndex + 1
            } else {
                destinationOffset = destinationIndex
            }
            
            self.stops
                .move(
                    fromOffsets: IndexSet(integer: sourceIndex),
                    toOffset: destinationOffset
                )
        }
    }
}

// MARK: - Actions
extension EditRoutePathCard {
    
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
