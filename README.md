A SwiftUI app for planning and organizing travel destinations and their sights. It uses SwiftData for persistent storage and provides an intuitive interface for adding, editing, and sorting destinations.

## Features

- **Add Destinations:** Create new travel destinations with details, date, and priority.
- **Manage Sights:** Add and remove sights for each destination.
- **Edit Destinations:** Update destination information and manage associated sights.
- **Sort & Search:** Sort destinations by name, priority, or date. Search destinations by name.
- **Sample Data:** Quickly add sample destinations for testing.

## Technologies

- SwiftUI
- SwiftData (for local data persistence)
- MVVM architecture

## Getting Started

1. Open the project in Xcode.
2. Build and run the app on a simulator or device.
3. Use the toolbar to add destinations or sample data.
4. Tap a destination to edit its details and manage sights.

## File Structure

- `iTourApp.swift`: App entry point and model container setup.
- `ContentView.swift`: Main navigation and toolbar.
- `DestinationListingView.swift`: Lists and manages destinations.
- `EditDestinationView.swift`: Edit destination details and sights.
- `Destination.swift`: Destination model.
- `Sight.swift`: Sight model.

## Requirements

- Xcode 15 or later
- iOS 17 or later

## License

This project is for educational purposes.
