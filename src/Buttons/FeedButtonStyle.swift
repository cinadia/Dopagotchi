//
//  Feed.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct FeedButtonStyle: ButtonStyle {
    @Environment(Pet.self) var pet
    func makeBody(configuration: Configuration) -> some View {
     
        configuration.label
            .frame(width: 40, height: 40)
            .background(pet.buttonColor)
            .foregroundStyle(.black)
            .clipShape(Circle())
            .padding()
            
    }
}
