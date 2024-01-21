//
//  Feed.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct FeedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
     
        configuration.label
            .frame(width: 40, height: 40)
            .background(Color(red: 0.5, green: 0, blue: 0))
            .foregroundStyle(.white)
            .clipShape(Circle())
            .padding()
            
    }
}
