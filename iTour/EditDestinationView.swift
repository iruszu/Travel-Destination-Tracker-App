//
//  EditDestinationView.swift
//  iTour
//
//  Created by Kellie Ho on 2025-05-24.
//

import SwiftUI
import SwiftData

struct EditDestinationView: View {
    @Bindable var destination: Destination
    @State private var newSightName = ""
    
    var body: some View {
        Form {
            TextField("Name", text: $destination.name)
            TextField("Details", text: $destination.details, axis: .vertical)
            DatePicker("Date", selection: $destination.date)
            
            Section("Priority") {
                Picker("Priority", selection: $destination.priority) {
                    Text("Meh").tag(1)
                    Text("Maybe").tag(2)
                    Text("Must").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section("Sights") {
                ForEach(destination.sights) {
                    sight in Text(sight.name)
                   
                }
                .onDelete(perform: deleteSight)
                
                
                HStack {
                    TextField("Add a new sight in \(destination.name)", text: $newSightName) //binding to state variable
                    Button("Add", action: addSight)
                        .buttonStyle(.borderedProminent)
                        .disabled(newSightName.isEmpty)
                        .cornerRadius(10)
                }

                
            }
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
    func addSight() {
        guard newSightName.isEmpty == false else { return } //checks if the string is not empty -> exits the function
        withAnimation {
            let sight = Sight(name: newSightName)
            destination.sights.append(sight)
            newSightName = "" // resets to empty after sight is added
        }
    }
    
    func deleteSight(_ indexSet: IndexSet) {
        for index in indexSet {
            destination.sights.remove(at: index)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Destination.self, configurations: config)
        let example = Destination(name: "Example", details: "Example details are here blah blah blah blah blah")
        return EditDestinationView(destination: example)
            .modelContainer(container)
    } catch {
        fatalError(error.localizedDescription)
    
    }
}
