//
//  PetView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct PetView: View {
    @Environment(Pet.self) var pet

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
        return "FrogSparkle"
        // TODO: bring back 'animations'
//        if pet.isSparkle {
//            return "FrogSparkle"
//        }
//        
//        if pet.health <= 30 {
//            return "FrogSad"
//        } else if pet.health < 100 {
//            return "FrogNeutral"
//        } else {
//            return"FrogHappy"
//        }
    }
}
