//
//  SettingsView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    @EnvironmentObject var pet: Pet
    @Environment(\.dismiss) private var dismiss
    @State var name: String
    @State var numActivities: Int
    @State var backgroundColor: Color
    @State var buttonColor: Color
    
    var body: some View {
        NavigationSplitView {
            VStack {
                Text("settings").customTitleFont()
                settings
                    .toolbar(content: self.toolbarContent)
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(pet.backgroundColor)
        } detail: {
            Text("Customize settings")
        }
    }
    
    var settings: some View {
        VStack {
            Form {
                HStack {
                    Text("pet name:").customFont()
                    TextField("rock", text: $name)
                }
                HStack {
                    Text("number of activities per day:").customFont()
                    TextField("5", value: $numActivities, format: .number)
                }
               
                HStack {
                    Text("button color:").customFont()
                    ColorPicker("", selection: $buttonColor)
                }
                
                HStack {
                    Text("background color:").customFont()
                    ColorPicker("", selection: $backgroundColor)
                }
            }
            .scrollContentBackground(.hidden)
            
            Spacer()
            
            Button {
                pet.name = name
                pet.numActivities = numActivities
                pet.backgroundColor = backgroundColor
                pet.buttonColor = buttonColor
                
                dismiss()
            } label: {
                Text("Save").customFont()
            }
            .buttonStyle(SaveButtonNewStyle())
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

