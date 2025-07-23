//
//  PetModel.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2025-04-30.
//
import Foundation
import SwiftData
import SwiftUI
@Model
final class Pet {
    var id = UUID()
    var name: String
    var health: Int
    var numActivities: Int
    var activitiesCompleted: Int
    var isActive: Bool
    var isSparkle: Bool

    private var buttonColorName: String // SwiftData doesn't support directly storing Color
    private var backgroundColorName: String
    

    var buttonColor: Color {
        get { Color(buttonColorName) }
        set { buttonColorName = newValue.description}
    }

    var backgroundColor: Color {
        get { Color(backgroundColorName) }
        set { backgroundColorName = newValue.description}
    }


    init(
        name: String = "rock",
        health: Int = 20,
        numActivities: Int = 5,
        activitiesCompleted: Int = 0,
        isActive: Bool = true,
        buttonColorName: String = "ButtonColor",
        backgroundColorName: String = "BackgroundColor"
    ) {
        self.name = name
        self.health = health
        self.numActivities = numActivities
        self.activitiesCompleted = activitiesCompleted
        self.isActive = isActive
        self.buttonColorName = buttonColorName
        self.backgroundColorName = backgroundColorName
        self.isSparkle = false
    }
}
