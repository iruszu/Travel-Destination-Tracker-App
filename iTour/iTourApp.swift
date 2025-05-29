//
//  iTourApp.swift
//  iTour
//
//  Created by Kellie Ho on 2025-05-22.
//

import SwiftUI
import SwiftData

@main
struct iTourApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }        .modelContainer(for: [Destination.self, Sight.self]) //tells swiftUI to create a persistent data storange container from destination

    }
}
