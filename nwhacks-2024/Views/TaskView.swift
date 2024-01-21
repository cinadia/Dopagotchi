//
//  TaskView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct TaskView: View {
    var body: some View {
        
        Grid(horizontalSpacing: 70) {
            GridRow {
                customFontText("starter")
                customFontText("main")
            }
            GridRow {
                AppsButton(icon: Image("app"))
                MainsButton(icon: Image("main"))
            }
            
            GridRow {
                customFontText("sides")
                customFontText("desserts")
            }
            GridRow {
                SidesButton(icon: Image("side"))
                DessertsButton(icon: Image("dessert"))
            }
            
            GridRow {
                customFontText("specials")
                customFontText("settings")
            }
            GridRow {
                SpecialsButton(icon: Image("special"))
                SettingsButton(icon: Image("settings"))
            }
        }
    }
    
    func customFontText(_ text: String) -> some View {
        Text(text).customFont()
    }
}

#Preview {
    TaskView()
}
