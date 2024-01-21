//
//  PetView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

class Pet: ObservableObject {
    @Published var health = 60
    @Published var name = "My Pet"
    @Published var activitiesCompleted = 0
}

struct PetView: View {
    @EnvironmentObject var pet: Pet
    
    var body: some View {
        VStack() {
            Image(String(pet.health))
            Image("cat")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Text("Activities completed today: " + String(pet.activitiesCompleted))
        }
    }
}

#Preview {
    PetView()
}
