//
//  SettingsView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var pet: Pet
    
    var body: some View {
        NavigationSplitView {
            settings
                .toolbar(content: self.toolbarContent)
                .navigationTitle("Settings")
        } detail: {
            Text("Customize settings")
        }
    }
    
    var settings: some View {
        VStack {
            Text("pet name: " + pet.name).customFont()
            Text("number of activities per day: 5").customFont()
            HStack {
                Text("colour theme: ").customFont()
                Rectangle()
                    .fill(Color("ButtonColor"))
                    .frame(width: 20, height: 20)
            }
        }
    }
}

extension SettingsView {
    @ToolbarContentBuilder
        func toolbarContent() -> some ToolbarContent {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Dismiss") {
                    dismiss()
                }
            }
        }
}

#Preview {
    SettingsView()
}
