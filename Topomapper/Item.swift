//
//  Item.swift
//  Topomapper
//
//  Created by Derek Chai on 05/08/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
