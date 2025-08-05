//
//  TaskView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct TaskView: View {
    @Environment(Pet.self) var pet
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Grid(horizontalSpacing: 70) {
            GridRow {
                AppsButton(icon: Image(colorScheme == .dark ? "appDark" :"app"))
                MainsButton(icon: Image(colorScheme == .dark ? "mainDark" :"main"))
            }
            GridRow {
                customFontText("starters")
                customFontText("mains")
            }
            
            GridRow {
                SidesButton(icon: Image(colorScheme == .dark ? "sideDark" : "side"))
                DessertsButton(icon: Image(colorScheme == .dark ? "dessertDark" : "dessert"))
            }
            GridRow {
                customFontText("sides")
                customFontText("desserts")
            }
            
            GridRow {
                SpecialsButton(icon: Image(colorScheme == .dark ? "specialDark" :"special"))
                SettingsButton(icon: Image(colorScheme == .dark ? "settingsDark" :"settings"))
            }
            GridRow {
                customFontText("specials")
                customFontText("settings")
            }
        }
        .environment(pet)
    }
    
    func customFontText(_ text: String) -> some View {
        Text(text).customFont()
    }
}
