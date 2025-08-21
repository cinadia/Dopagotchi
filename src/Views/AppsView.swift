//
//  AppsView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct AppsView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.modelContext) var context
    @EnvironmentObject var petViewModel: PetViewModel
    
    var body: some View {
        ItemView<AppItem>(
            itemViewModel: ItemViewModel(context: context, createItem: { AppItem(description: $0) }),
            title: "starters",
            subtitle: "activites that are quick and don't suck you in",
            imageName: colorScheme == .dark ? "appDark" : "app",
        )
    }
}

#Preview {
    AppsView()
        .modelContainer(for: AppItem.self, inMemory: true)
}
