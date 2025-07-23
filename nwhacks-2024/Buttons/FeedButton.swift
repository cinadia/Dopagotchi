//
//  FeedButton.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct FeedButton: View {
    @Environment(Pet.self) var pet
    @Environment(\.showingSheet) var showingSheet
    
    var body: some View {
        Button {
            if pet.health < 100 {
                pet.health += 10
            }
            pet.activitiesCompleted += 1
            pet.isSparkle = true
            self.showingSheet?.wrappedValue = false
            
            Task {
                try await Task.sleep(nanoseconds: 2_000_000_000)
                pet.isSparkle = false
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
