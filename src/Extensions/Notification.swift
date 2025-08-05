//
//  Notification.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2025-06-15.
//
import UIKit

extension Notification {
    var keyboardHeight: CGFloat {
        (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}
