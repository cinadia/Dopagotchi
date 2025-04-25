//
//  DessertsView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct DessertsView: View {
    var body: some View {
        ItemView<DessertItem>(
            title: "desserts",
            subtitle: "activities that don’t make you feel \n great if you overdo them", // TODO: resizing text to fit screen
            imageName: "dessert",
            createItem: { DessertItem(description: $0) }
        )
    }
}

#Preview {
    DessertsView()
        .modelContainer(for: DessertItem.self, inMemory: true)
}
