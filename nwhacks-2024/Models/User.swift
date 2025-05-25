//
//  User.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2025-04-30.
//
import Foundation
import SwiftData
import SwiftUI

@Model
final class User: Identifiable {
    var id = UUID()
    var currency = 0

    @Relationship(deleteRule: .cascade)
    var pets: [Pet] = []

        init() {
            self.pets = [Pet()]
        }
}

