//
//  TextStyles.swift
//  nwhacks-2024
//
//  Created by Cindy Cui on 2024-01-20.
//

import SwiftUI

extension Text {
    
    func customFont() -> some View {
        self.font(Font.custom("SHPinscher-Regular", size: 25))
    }
    
    func customTitleFont() -> some View {
        self.font(Font.custom("SHPinscher-Regular", size: 60))
    }
    
    func customSmallFont() -> some View {
        self.font(Font.custom("SHPinscher-Regular", size: 20))
    }
    
    
}
