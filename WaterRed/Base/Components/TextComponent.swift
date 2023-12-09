//
//  TextComponent.swift
//  WaterRed
//
//  Created by Sayan Samaddar on 11/12/22.
//

import SwiftUI

// MARK: - Custom Font Weights

enum CustomFontWeight: String {
    case bold = "Mulish-Bold"
    case semibold = "Mulish-SemiBold"
    case medium = "Mulish-Medium"
    case regular = "Mulish-Regular"
    case light = "Mulish-Light"
}

// MARK: - Custom Font Colors

enum CustomFontColor: String {
    case accent = "AccentColor"
    case dark = "gray"
    case light = "text_light"
    case extraLight = "secondary_gray"
    case red = "primary_red"
    case blue = "primary_blue"
    case yellow, black, white
}

// MARK: - Text Component

struct TextComponent: View {
    let text: String
    let fontWeight: CustomFontWeight
    let fontSize: CGFloat
    let fontColor: CustomFontColor
    let alignment: TextAlignment
    let fixedSize: Bool
    
    internal init(
        text: String,
        fontWeight: CustomFontWeight = .regular,
        fontSize: CGFloat = 14,
        fontColor: CustomFontColor = .black,
        alignment: TextAlignment = .leading,
        fixedSize: Bool = false
    ) {
        self.text = text
        self.fontWeight = fontWeight
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.alignment = alignment
        self.fixedSize = fixedSize
    }
    
    var body: some View {
        Text(text)
            .font(.custom(fontWeight.rawValue, size: fontSize))
            .foregroundColor(Color(fontColor.rawValue))
            .multilineTextAlignment(alignment)
            .fixedSize(horizontal: false, vertical: fixedSize)
    }
}
