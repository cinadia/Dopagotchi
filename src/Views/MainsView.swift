//
//  Mains.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct MainsView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.modelContext) var context
    @EnvironmentObject var petViewModel: PetViewModel
    
    var body: some View {
        ItemView<MainItem>(
            itemViewModel: ItemViewModel(context: context, createItem: { MainItem(description: $0) }),
            title: "mains",
            subtitle: "activities that take a bit longer",
            imageName: colorScheme == .dark ? "mainDark" : "main",
        )
    }
}

#Preview {
    MainsView()
        .modelContainer(for: MainItem.self, inMemory: true)
}
