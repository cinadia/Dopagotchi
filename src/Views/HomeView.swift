//
//  HomeView.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2025-07-23.
//

struct HomeView: View {
    var body: some View {
        VStack {
            PetView().environment(activePet)
            TaskView().environment(activePet)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                InfoButton()
            }
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(activePet.backgroundColor)
    }
}
