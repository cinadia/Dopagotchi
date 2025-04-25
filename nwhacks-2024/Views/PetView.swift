//
//  PetView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

class Pet: ObservableObject {
    @Published var health = 20
    @Published var name = "rock"
    @Published var numActivities = 5
    @Published var activitiesCompleted = 0
    @Published var isSparkle = false
    @Published var buttonColor = Color("ButtonColor")
    @Published var backgroundColor = Color("BackgroundColor")
}

struct PetView: View {
    @EnvironmentObject var pet: Pet
    
    var body: some View {
        VStack {
            Image(String(pet.health))
            Text("activities completed today: " + String(pet.activitiesCompleted))
                .customFont()
            Image(getFrog())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 150)
            Text(pet.name).customFont()
        }
    }
    
    private func getFrog() -> String {
        if pet.isSparkle {
            return "FrogSparkle"
        }
        
        if pet.health <= 30 {
            return "FrogSad"
        } else if pet.health < 100 {
            return "FrogNeutral"
        } else {
            return"FrogHappy"
        }
    }
}
