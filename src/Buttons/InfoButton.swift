//
//  InfoButton.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-21.
//

import SwiftUI

struct InfoButton: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showingInfoSheet = false
    
    var body: some View {
        Button {
            showingInfoSheet.toggle()
        } label: {
            Image(colorScheme == .dark ? "questionmarkDark" : "questionmark")
               .frame(width: 40, height: 40)
               .background(.button)
               .clipShape(Circle())
               .padding()
        }
        .sheet(isPresented: $showingInfoSheet) {
            InfoView()
        }
    }
}
