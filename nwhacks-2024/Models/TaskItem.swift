//
//  Item.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class TaskItem: Identifiable {
    var id = UUID()
    var desc: String
    var type: String?
    // TODO: @relationship for deleting values?
    init(description: String, type: String?) {
        self.desc = description
        self.type = type
    }
}
