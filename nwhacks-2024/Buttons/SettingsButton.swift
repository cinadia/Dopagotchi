//
//  SettingsButton.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct SettingsButton: View {
    let icon: Image
    @EnvironmentObject var pet: Pet
    @State private var showingSheet = false
//    let sheetView = SettingsView(name: pet.name)
    
    var body: some View {
        Button {
            showingSheet.toggle()
        } label: {
            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 60)
                .background(Circle()
                    .fill(pet.buttonColor)
                    .frame(width: 90, height: 90)
                )
                .padding()
        }
        .sheet(isPresented: $showingSheet) {
            SettingsView(name: pet.name, numActivities: pet.numActivities, backgroundColor: pet.backgroundColor, buttonColor: pet.buttonColor)
        }
    }
}

#Preview {
    SettingsButton(icon: Image("cat"))
}
