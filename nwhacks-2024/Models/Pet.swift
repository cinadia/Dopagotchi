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
    private var buttonColorHex: String
    private var backgroundColorHex: String

    var buttonColor: Color {
        get { Color(hex: buttonColorHex) }
        set { buttonColorHex = newValue.toHex() ?? "#000000" }
    }

    var backgroundColor: Color {
        get { Color(hex: backgroundColorHex) }
        set { backgroundColorHex = newValue.toHex() ?? "#FFFFFF" }
    }
    
    init(name: String = "rock", health: Int = 20, numActivities: Int = 5, activitiesCompleted: Int = 0, isActive: Bool = true, buttonColor: Color =  Color("ButtonColor"), backgroundColor: Color = Color("BackgroundColor")) {
        self.name = name
        self.health = health
        self.numActivities = numActivities
        self.activitiesCompleted = activitiesCompleted
        self.isActive = isActive
        self.buttonColorHex = buttonColor.toHex() ?? "#DD80AD"
        self.backgroundColorHex = backgroundColor.toHex() ?? "#E9DCE2"
    }
}
