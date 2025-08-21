//
//  DessertsView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct DessertsView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.modelContext) var context
    @EnvironmentObject var petViewModel: PetViewModel
    
    var body: some View {
        ItemView<DessertItem>(
            itemViewModel: ItemViewModel(context: context, createItem: { DessertItem(description: $0) }),
            title: "desserts",
            subtitle: "activities that don’t make you feel \n great if you overdo them", // TODO: resizing text to fit screen
            imageName: colorScheme == .dark ? "dessertDark" : "dessert",
        )
    }
}

#Preview {
    DessertsView()
        .modelContainer(for: DessertItem.self, inMemory: true)
}
