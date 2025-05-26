//
//  ContentView.swift
//  iTour
//
//  Created by Kellie Ho on 2025-05-22.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext //gives view access to app's swiftdata storage

    @State private var path = [Destination]()
    @State private var sortOrder = SortDescriptor(\Destination.name) // sort  by name
    
    var body: some View {
        NavigationStack(path: $path) {
            
            DestinationListingView(sort: sortOrder)
            .navigationTitle("iTour")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
            .toolbar {
                Button("Add Samples", action: addSamples)
                Button("Add Destination", systemImage: "plus", action: addDestination)
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Name")
                            .tag(SortDescriptor(\Destination.name))
                        Text("Priority")
                            .tag(SortDescriptor(\Destination.priority, order: .reverse))
                        Text("Date")
                            .tag(SortDescriptor(\Destination.date))
                    }
                }
                
            }
            
            
        }
    }
    
    func addSamples() {
        let rome = Destination(name: "Rome")
        let japan = Destination (name: "Japan")
        
        modelContext.insert(rome) //insert sample data into "Add Samples" button
        modelContext.insert(japan)
        
    }
    
    func addDestination() {
        let destination = Destination()
        modelContext.insert(destination)
        path = [destination]
    }
    

    
}

#Preview {
    ContentView()
}
