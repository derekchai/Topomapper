//
//  StopListItem.swift
//  Topomapper
//
//  Created by Derek Chai on 13/08/2024.
//

import SwiftUI

struct StopListItem: View {
    // MARK: - Exposed Properties
    let stop: String
    
    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: "mappin.circle.fill")
                .foregroundStyle(.tertiary)
            
            Text(stop)
            
            Spacer()
            
            Image(systemName: "line.3.horizontal")
                .foregroundStyle(.tertiary)
        }
        .padding(8)
        .listRowSeparatorTint(.secondary.opacity(0.3))
        .background(.quinary)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

// MARK: - Preview
#Preview {
    StopListItem(stop: "Stop A")
}


// this is a comment
