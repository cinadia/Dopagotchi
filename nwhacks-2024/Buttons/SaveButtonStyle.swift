//
//  SaveButtonStyle.swift
//  nwhacks-2024
//
//  Created by Alison Co on 2024-01-21.
//

import SwiftUI

struct SaveButtonStyle: ButtonStyle {
    @EnvironmentObject var pet: Pet
    
    func makeBody(configuration: Configuration) -> some View {

        configuration.label
            .frame(width: 80, height: 80)
            .background(pet.buttonColor)
            .foregroundStyle(.white)
            .clipShape(Circle())
            .padding()

    }
}
