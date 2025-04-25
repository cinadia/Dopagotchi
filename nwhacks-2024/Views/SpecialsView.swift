//
//  SpecialsView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct SpecialsView: View {
    var body: some View {
        ItemView<SpecialItem>(
            title: "specials",
            subtitle: "activities that are expensive or less convenient",
            imageName: "special",
            createItem: { SpecialItem(description: $0) }
        )
    }
}

#Preview {
    SpecialsView()
        .modelContainer(for: SpecialItem.self, inMemory: true)
}
