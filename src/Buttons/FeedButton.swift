//
//  FeedButton.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import AVFoundation

struct FeedButton: View {
    @Environment(\.modelContext) private var context
    @Environment(\.showingSheet) var showingSheet
    @EnvironmentObject var petViewModel: PetViewModel
    
    var body: some View {
        Button {
            petViewModel.feedPet(context: context)
            self.showingSheet?.wrappedValue = false
        } label: {
            Text("Feed")
                .customSmallFont()
        }
        .buttonStyle(FeedButtonStyle())
    }
}
