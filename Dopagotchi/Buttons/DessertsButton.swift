//
//  DessertsButton.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct DessertsButton: View {
    let icon: Image
    
    var body: some View {
        ItemButton(
            icon: icon,
            iconHeight: 60,
            sheetContent: { DessertsView() }
        )
    }
}

#Preview {
    DessertsButton(icon: Image("cat"))
}
