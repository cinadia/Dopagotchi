//
//  SpecialsView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct SpecialsView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.modelContext) var context
    @EnvironmentObject var petViewModel: PetViewModel
    
    var body: some View {
        ItemView<SpecialItem>(
            itemViewModel: ItemViewModel(context: context, createItem: { SpecialItem(description: $0) }),
            title: "specials",
            subtitle: "activities that are expensive or less convenient",
            imageName: colorScheme == .dark ? "specialDark" : "special",
        )
    }
}

#Preview {
    SpecialsView()
        .modelContainer(for: SpecialItem.self, inMemory: true)
}
