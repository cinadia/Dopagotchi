//
//  nwhacks_2024App.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

@main
struct nwhacks_2024App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            User.self,
            Pet.self,
            MainItem.self,
            AppItem.self,
            SideItem.self,
            DessertItem.self,
            SpecialItem.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
