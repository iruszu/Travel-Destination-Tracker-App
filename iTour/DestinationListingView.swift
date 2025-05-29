//
//  DestinationListingView.swift
//  iTour
//
//  Created by Kellie Ho on 2025-05-26.
//

import SwiftUI
import SwiftData

struct DestinationListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Destination.priority, order: .reverse), SortDescriptor(\Destination.name, order: .reverse)]) var destinations: [Destination] //reads out all destination objects we have stored, watches database for changes, and updates automatically
    
    var body: some View {
        List {
            ForEach(destinations) {
                destination in
                NavigationLink(value: destination) { VStack(alignment: .leading) {
                    Text(destination.name)
                        .font(.headline)
                    Text(destination.date.formatted(date: .long, time: .shortened))
                    Text(destination.sights.count == 1 ? "\(destination.sights.count) sight" : "\(destination.sights.count) sights")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                }
            }.onDelete(perform: deleteDestinations)
        }
    }
    
    init(sort: SortDescriptor<Destination>, searchString: String) {
        _destinations = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true //"Item passes the filter, include it into query results"
            } else {
                return $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }

    
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name), searchString: "")
}
