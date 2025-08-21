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
    @Environment(\.modelContext) var context
   
    @State private var viewModel: UserViewModel?
    
    init() {
        // Check if the app has launched before
        let hasLaunchedBefore = UserDefaults.standard.bool(forKey: "hasLaunchedBefore")
        _showHome = State(initialValue: hasLaunchedBefore)
        
        if !hasLaunchedBefore {
            UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
        }
    }
    
    var body: some View {
        Group {
            if showHome, let viewModel = viewModel, let petViewModel = viewModel.activePetViewModel {
                VStack {
                    PetView()
                    TaskView()
                }
                .containerRelativeFrame([.horizontal, .vertical])
                .background(petViewModel.pet.backgroundColor)
                .environmentObject(petViewModel)
            }
            else {
                WelcomeView(showHome: $showHome)
            }
        }
        .onAppear() {
            // Environment variables are not available on init(). Must create UserViewModel
            // during .onAppear() so we can use `context` from the Environment variable
            if viewModel == nil {
                viewModel = UserViewModel(context: context)
            }
            viewModel?.checkDailyReset()
        }
    }
}
