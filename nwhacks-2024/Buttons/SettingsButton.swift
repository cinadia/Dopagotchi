//
//  SettingsButton.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct SettingsButton: View {
    let icon: Image
    @State private var showingSheet = false
    let sheetView = SettingsView()
    
    var body: some View {
        Button {
            showingSheet.toggle()
        } label: {
            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
        }
        .sheet(isPresented: $showingSheet) {
            sheetView
        }
    }
}

#Preview {
    SettingsButton(icon: Image("cat"))
}
