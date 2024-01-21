//
//  Welcome1.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var showHome: Bool
    
    var body: some View {
        VStack {
            Text("Welcome")
                .customTitleFont()
            WelcomeSubView(showHome: $showHome)
                .background(Color("ButtonColor").opacity(0.2))
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Color("BackgroundColor"))
    }
}

#Preview {
    WelcomeView(showHome: .constant(false))
}
