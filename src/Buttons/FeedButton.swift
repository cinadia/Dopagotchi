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
    @Environment(Pet.self) var pet
    @Environment(\.showingSheet) var showingSheet
    @State var feedSoundEffect: AVAudioPlayer?
    
    var body: some View {
        Button {
            
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
            pet.isSparkle = true
            
            self.showingSheet?.wrappedValue = false
            
            Task {
                try await Task.sleep(nanoseconds: 2_000_000_000)
                pet.isSparkle = false
            }
            do {
                try context.save()
            } catch {
                print("Failed to save feed: \(error)")
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
