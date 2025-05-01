//
//  ContentView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var showHome: Bool
    @Query var pets: [Pet]
    @Query var users: [User]
    @Environment(\.modelContext) var context
    
    // Try to get the existing user, or create a new one
    var user: User {
        if let existingUser = users.first {
            return existingUser
        } else {
            let newUser = User()
            context.insert(newUser)
            try? context.save()
            return newUser
        }
    }
    
    init() {
        // Check if the app has launched before
        let hasLaunchedBefore = UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
        _showHome = State(initialValue: hasLaunchedBefore)
        
        if !hasLaunchedBefore {
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
        }
    }
    
    var body: some View {
        var activePet: Pet {
            user.pets.first(where: { $0.isActive }) ?? {
                // (this shouldn't be hit)
                let fallback = Pet()
                user.pets.append(fallback)
                try? context.save()
                return fallback
            }()
        }
        
        NavigationView {
            if showHome {
                VStack {
                    PetView().environment(activePet)
                    TaskView().environment(activePet)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        InfoButton()
                    }
                }
                .containerRelativeFrame([.horizontal, .vertical])
                .background(activePet.backgroundColor)
            } else {
                WelcomeView(showHome: $showHome)
            }
        }
        .environment(activePet)
        
    }
}

#Preview {
    ContentView()
}
