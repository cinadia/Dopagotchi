//
//  SettingsView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI
import SwiftData

struct SettingsView: View {
    @Environment(\.modelContext) private var context
    @Bindable var pet: Pet
    @Environment(\.dismiss) private var dismiss
    
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
                    TextField(pet.name, text: $pet.name)
                }
                HStack {
                    Text("number of activities per day:").customFont()
                    TextField(String(pet.numActivities), value: $pet.numActivities, format: .number)
                }
               
                // TODO: I think we should have some default colur SCHEMES that the user can pick.
                // Having the user pick their colours directly means we'd have to store .buttonColor and
                // .backgroundColor as hex values and convert them to Color objects (because SwiftData does
                // not support storing Colors directly), which messes with the default "ButtonColor" and
                // "BackgroundColor" values we have in Assets. And these two colours have nice light/dark
                // mode values too which I'd like to keep. Removing this for now....
//                HStack {
//                    Text("button color:").customFont()
//                    ColorPicker("", selection: $pet.buttonColor)
//                }
//                
//                HStack {
//                    Text("background color:").customFont()
//                    ColorPicker("", selection: $pet.backgroundColor)
//                }
            }
            .scrollContentBackground(.hidden)
            
            Spacer()
            
            Button {
                do {
                    try context.save()
                } catch {
                    print("Failed to save pet: \(error)")
                }
                
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
                Button(action: {
                    dismiss()
                }) {
                    Text("Dismiss").customFont().foregroundStyle(.button)
                }
            }
        }
}

