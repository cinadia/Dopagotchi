//
//  NextButton.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct NextButton: View {
    @Binding var showHome: Bool
    
    var body: some View {
        Button {
            showHome = true
        } label: {
            Text("Next")
                .customSmallFont()
               .frame(width: 40, height: 40)
               .background(Color("ButtonColor"))
               .foregroundStyle(.white)
               .clipShape(Circle())
               .padding()
        }
    }
}
