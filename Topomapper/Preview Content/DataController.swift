//
//  DataController.swift
//  Topomapper
//
//  Created by Derek Chai on 07/08/2024.
//

import Foundation
import SwiftData

@MainActor
class DataController {
    static let previewModelContainer: ModelContainer = {
        let schema = Schema([
            Route.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        
        do {
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            for i in 1...10 {
                let route = Route(name: "Route \(i)", creationDate: Date(), waypoints: [])
                
                container.mainContext.insert(route)
            }
            
            container.mainContext.insert(Route.angelusHut)
            
            return container
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
}
