//
//  TaskView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var pet: Pet
    
    var body: some View {
        Grid(horizontalSpacing: 70) {
            GridRow {
                AppsButton(icon: Image("app"))
                MainsButton(icon: Image("main"))
            }
            GridRow {
                customFontText("starters")
                customFontText("mains")
            }
            
            GridRow {
                SidesButton(icon: Image("side"))
                DessertsButton(icon: Image("dessert"))
            }
            GridRow {
                customFontText("sides")
                customFontText("desserts")
            }
            
            GridRow {
                SpecialsButton(icon: Image("special"))
                SettingsButton(icon: Image("settings"))
            }
            GridRow {
                customFontText("specials")
                customFontText("settings")
            }
        }
        .environmentObject(pet)
    }
    
    func customFontText(_ text: String) -> some View {
        Text(text).customFont()
    }
}
