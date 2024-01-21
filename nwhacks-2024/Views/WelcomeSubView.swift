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
                        .fill(index == self.index ? Color("ButtonColor") : Color("ButtonColor").opacity(0.5))
                        .frame(width: 20, height: 20)
                }
            }
            .padding()
            
            if (index == 2) {
                NextButton(showHome: $showHome)
                    .padding()
            } else {
                NextButton(showHome: $showHome)
                    .opacity(0.5)
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
            frogView(imageName: "FrogSparkle", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris")
        case 1:
            frogView(imageName: "FrogHappy", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris")
        case 2:
            frogView(imageName: "FrogSad", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris")
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
