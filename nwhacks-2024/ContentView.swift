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
    @StateObject var pet = Pet()
    
    init() {
        // Check if the app has launched before
        let hasLaunchedBefore = UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
        _showHome = State(initialValue: hasLaunchedBefore)
        
        // If it's the first launch, mark it as launched
        if !hasLaunchedBefore {
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
        }
    }
    
    var body: some View {
        NavigationView {
            if showHome {
                VStack {
                    PetView().environmentObject(pet)
                    TaskView().environmentObject(pet)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        InfoButton()
                    }
                }
                .containerRelativeFrame([.horizontal, .vertical])
                .background(pet.backgroundColor)
            } else {
                WelcomeView(showHome: $showHome)
            }
        }
        .environmentObject(pet)
        
    }
}

#Preview {
    ContentView()
}
