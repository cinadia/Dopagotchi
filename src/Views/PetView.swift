//
//  PetView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct PetView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var petViewModel: PetViewModel
    
    var body: some View {
        VStack {
            // TODO: need to fix this Image because we eventually want it to represent
            // the pet's health, not # of activities completed
            // Image(String(pet.health) + (colorScheme == .dark ? "dark" : "light"))
            
            Image(String(petViewModel.healthProgress) + (colorScheme == .dark ? "dark" : "light"))
            Text("activities completed today: " + String(petViewModel.pet.activitiesCompleted))
                .customFont()
            Image(petViewModel.frogImageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 150)
            Text(petViewModel.pet.name).customFont()
        }
        .onAppear() {
            petViewModel.updateProgress()
        }
    }
}
