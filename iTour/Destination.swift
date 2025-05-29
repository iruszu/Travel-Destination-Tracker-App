//
//  Destination.swift
//  iTour
//
//  Created by Kellie Ho on 2025-05-22.
//

import Foundation
import SwiftData


@Model
class Destination {
    var name: String
    var details: String
    var date: Date
    var priority: Int
    @Relationship(deleteRule:.cascade) var sights = [Sight]() //all sights deleted when destination is deleted
    
    
    init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) { // = "" is default value
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}
