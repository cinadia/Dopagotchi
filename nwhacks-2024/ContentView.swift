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
        if showHome {
            VStack {
                PetView().environmentObject(pet)
                TaskView().environmentObject(pet)
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(Color("BackgroundColor"))
        } else {
            WelcomeView(showHome: $showHome)
        }
        
    }
}

#Preview {
    ContentView()
}
