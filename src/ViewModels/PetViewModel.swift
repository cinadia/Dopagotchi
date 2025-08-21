//
//  PetViewModel.swift
//  Dopagotchi
//
//  Created by Cindy Cui on 2025-08-18.
//

import Foundation
import SwiftUI
import SwiftData
import AVFoundation


@MainActor
class PetViewModel: ObservableObject {
    @Published var pet: Pet
    @Published var healthProgress: Int = 10 
    @Published var frogImageName: String = "FrogSad"
    
    @State var feedSoundEffect: AVAudioPlayer?
    
    init(pet: Pet) {
        self.pet = pet
    }
    
    func updateProgress(isSparkle: Bool = false) {
        let scaled = (Double(pet.activitiesCompleted) / Double(pet.numActivities)) * 100
        let clamped = min(max(scaled, 10), 100)
        healthProgress = Int(floor(Double(clamped) / 10) * 10)
        updateFrogImage(isSparkle: isSparkle)
    }
    
    func updateFrogImage(isSparkle: Bool) {
        if isSparkle {
            frogImageName = "FrogSparkle"
        } else if healthProgress <= 30 {
            frogImageName = "FrogSad"
        } else if healthProgress < 100 {
            frogImageName = "FrogNeutral"
        } else {
            frogImageName = "FrogHappy"
        }
    }
    
    func feedPet(context: ModelContext) {
        
        // Play feed sound 
        let path = Bundle.main.path(forResource: "frog-sfx.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            feedSoundEffect = try AVAudioPlayer(contentsOf: url)
            feedSoundEffect?.play()
        } catch {
            print("Error - Couldn't play sound: \(error)")
        }
        
        if pet.health < 100 {
            pet.health += 10
        }
        pet.activitiesCompleted += 1
        
        updateProgress(isSparkle: true)
        
        do {
            try context.save()
        } catch {
            print("Failed to save feed: \(error)")
        }
        
        Task {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            updateFrogImage(isSparkle: false)
        }
    }
    

}
