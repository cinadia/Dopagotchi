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
    
    var body: some View {
        ItemView<AppItem>(
            title: "starters",
            subtitle: "activites that are quick and don't suck you in",
            imageName: colorScheme == .dark ? "appDark" : "app",
            createItem: { AppItem(description: $0) }
        )
    }
}

#Preview {
    AppsView()
        .modelContainer(for: AppItem.self, inMemory: true)
}
