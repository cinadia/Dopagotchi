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
    
    var body: some View {
        ItemView<SideItem>(
            title: "sides",
            subtitle: "activities that you can add to other activities to make it more enjoyable",
            imageName: colorScheme == .dark ? "sideDark" :"side",
            createItem: { SideItem(description: $0) }
        )
    }
}

#Preview {
    SidesView()
        .modelContainer(for: SideItem.self, inMemory: true)
}
