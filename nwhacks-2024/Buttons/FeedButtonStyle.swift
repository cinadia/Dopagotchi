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
            .background(Color("ButtonColor"))
            .foregroundStyle(.white)
            .clipShape(Circle())
            .padding()
            
    }
}
