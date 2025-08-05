//
//  Publishers.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2025-06-15.
//
import Combine
import UIKit

enum KeyboardPublisher {
    static var height: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }

        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }

        return Publishers.MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}
