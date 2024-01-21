//
//  FeedButton.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct FeedButton: View {
    @EnvironmentObject var pet: Pet
    
    var body: some View {
        Button {
            if pet.health < 100 {
                pet.health += 10
                pet.activitiesCompleted += 1
            }
        } label: {
            Text("Feed")
                .customSmallFont()
        }
        .buttonStyle(FeedButtonStyle())
    }
}

#Preview {
    FeedButton()
}
