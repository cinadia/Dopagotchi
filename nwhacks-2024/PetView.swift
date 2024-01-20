//
//  PetView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct PetView: View {
    var body: some View {
        Image("cat")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}

#Preview {
    PetView()
}
