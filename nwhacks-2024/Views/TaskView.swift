//
//  TaskView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct TaskView: View {
    var body: some View {
        
        Grid {
            GridRow {
                AppsButton(icon: Image("cat"))
                MainsButton(icon: Image("cat"))
            }
            .padding()
            GridRow {
                SidesButton(icon: Image("cat"))
                DessertsButton(icon: Image("cat"))
            }
            .padding()
            GridRow {
                SpecialsButton(icon: Image("cat"))
                SettingsButton(icon: Image("cat"))
            }
            .padding()
        }
    }
}

#Preview {
    TaskView()
}
