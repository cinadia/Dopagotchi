//
//  ContentView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var showHome = false
    @StateObject var pet = Pet()

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
