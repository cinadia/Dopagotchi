//
//  MainsButton.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct MainsButton: View {
    let icon: Image
    
    var body: some View {
        ItemButton(
            icon: icon,
            iconHeight: 50,
            sheetContent: { MainsView() }
        )
    }
}

#Preview {
    MainsButton(icon: Image("cat"))
}
