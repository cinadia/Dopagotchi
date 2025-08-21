//
//  SidesView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct SidesView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.modelContext) var context
    @EnvironmentObject var petViewModel: PetViewModel
    
    var body: some View {
        ItemView<SideItem>(
            itemViewModel: ItemViewModel(context: context, createItem: { SideItem(description: $0) }),
            title: "sides",
            subtitle: "activities that you can add to other activities to make it more enjoyable",
            imageName: colorScheme == .dark ? "sideDark" :"side",
        )
    }
}

#Preview {
    SidesView()
        .modelContainer(for: SideItem.self, inMemory: true)
}
