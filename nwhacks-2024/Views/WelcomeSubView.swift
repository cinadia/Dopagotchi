//
//  WelcomeSubView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

struct WelcomeSubView: View {
    @State private var index = 0
    @Binding var showHome: Bool
    
    var body: some View {
        VStack{
            TabView(selection: $index) {
                ForEach((0..<3), id: \.self) { index in
                    CardView(index: index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            HStack(spacing: 2) {
                ForEach((0..<3), id: \.self) { index in
                    Circle()
                        .fill(index == self.index ? Color("ButtonColor") : Color("ButtonColor").opacity(0.2))
                        .frame(width: 20, height: 20)
                }
            }
            .padding()
            
            if (index == 2) {
                NextButton(showHome: $showHome)
                    .padding()
            } else {
                NextButton(showHome: $showHome)
                    .opacity(0)
                    .padding()
                    .disabled(true)
            }
        }
        .frame(height: 500)
    }
}

struct CardView: View {
    var index: Int
    
    var body: some View{
        switch index {
        case 0:
            frogView(imageName: "FrogSparkle", text: "Hello! I am your pet frog.")
        case 1:
            frogView(imageName: "FrogHappy", text: "Sometimes I get hungry.")
        case 2:
            frogView(imageName: "FrogSad", text: "But you can feed me to keep me happy! Start by adding 'food' items in each category, which are tasks that will keep you happy, too. When you complete an activity, feed me!")
        default:
            frogView(imageName: "FrogSparkle", text: "default")
        }
    }
    
    @ViewBuilder
    func frogView(imageName: String, text: String) -> some View {
        HStack {
            Spacer()
            RoundedRectangle(cornerRadius: 25)
                .opacity(0)
                .frame(width: 350, height: 400)
                .overlay(
                    VStack {
                        Image(imageName)
                            .scaledToFill()
                            .frame(height: 200)
                        Text(text)
                            .customSmallFont()
                            .multilineTextAlignment(.center)
                    }
                )
                .padding()
            Spacer()
        }
    }
}

#Preview {
    WelcomeSubView(showHome: .constant(false))
}
