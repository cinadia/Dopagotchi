//
//  ContentView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct ContentView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var items: [TaskItem]

    var body: some View {
        PetView()
        TaskView()
    }
}

#Preview {
    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
}
