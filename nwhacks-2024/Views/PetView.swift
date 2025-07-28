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
    @Environment(Pet.self) var pet

    var body: some View {
        VStack {
            // TODO: need to fix this Image because we eventually want it to represent
            // the pet's health, not # of activities completed
//            Image(String(pet.health) + (colorScheme == .dark ? "dark" : "light"))
            
            let scaled = (Double(pet.activitiesCompleted) / Double(pet.numActivities)) * 100
            let clamped = min(max(scaled, 10), 100)
            let floored = Int(floor(Double(clamped) / 10) * 10)
            Image(String(floored) + (colorScheme == .dark ? "dark" : "light"))
            Text("activities completed today: " + String(pet.activitiesCompleted))
                .customFont()
            Image(getFrog(progress: floored))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 150)
            Text(pet.name).customFont()
        }
    }
    
    private func getFrog(progress: Int) -> String {
        // TODO: bring back 'animations'
        if pet.isSparkle {
            // TODO: some of the dark frog vectors are very big and I don't know why lol
            return colorScheme == .dark ? "FrogSparkleDark": "FrogSparkle"
        }
        
        if progress <= 30 {
            return colorScheme == .dark ? "FrogSadDark" : "FrogSad"
        } else if progress < 100 {
            return colorScheme == .dark ? "FrogNeutralDark" : "FrogNeutral"
        } else {
            return colorScheme == .dark ? "FrogHappyDark" : "FrogHappy"
        }
    }
}
