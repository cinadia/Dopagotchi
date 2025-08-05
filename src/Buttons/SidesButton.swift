//
//  SidesButton.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct SidesButton: View {
    let icon: Image
    
    var body: some View {
        ItemButton(
            icon: icon,
            iconHeight: 60, // TODO: why are some height 60 and some 50?
            sheetContent: { SidesView() }
        )
    }
}

#Preview {
    SidesButton(icon: Image("cat"))
}

