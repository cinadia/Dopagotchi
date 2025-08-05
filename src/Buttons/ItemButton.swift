//
//  ItemButton.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2025-04-25.
//

import SwiftUI

struct ItemButton<SheetContent: View>: View {
    @Environment(Pet.self) var pet
    let icon: Image
    let iconHeight: CGFloat
    let sheetContent: () -> SheetContent
    
    @State private var showingSheet = false
    
    var body: some View {
        Button {
            showingSheet.toggle()
        } label: {
            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: iconHeight)
                .background(
                    Circle()
                        .fill(pet.buttonColor)
                        .frame(width: 90, height: 90)
                )
                .padding()
        }
        .fullScreenCover(isPresented: $showingSheet ) {
            sheetContent()
                .environment(\.showingSheet, $showingSheet)
        }
    }
}

