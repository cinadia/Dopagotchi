//
//  ContentView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    @StateObject var pet = Pet()

    var body: some View {
        VStack {
            PetView().environmentObject(pet)
            TaskView().environmentObject(pet)
        }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(Color("BackgroundColor"))
    }
}

#Preview {
    ContentView()
}
