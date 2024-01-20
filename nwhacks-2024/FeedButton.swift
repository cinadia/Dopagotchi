//
//  FeedButton.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct FeedButton: View {
    var body: some View {
        Button {
            print("feeding....")
        } label: {
            Text("Feed")
        }
    }
}

#Preview {
    FeedButton()
}
