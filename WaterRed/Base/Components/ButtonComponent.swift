//
//  ButtonComponent.swift
//  WaterRed
//
//  Created by Rhymetech on 06/12/22.
//

import SwiftUI

// MARK: - Button Styles

enum ButtonStyle {
    case border
    case solid
    case capsule
}

enum ButtonLabelColor: String {
    case red = "primary_red"
    case blue = "primary_blue"
}

// MARK: - Button Component

struct ButtonComponent: View {
    let title: String
    let style: ButtonStyle
    let isMaxWidth: Bool
    let isSelected: String
    let bgColor: ButtonLabelColor
    
    internal init(
        title: String,
        style: ButtonStyle = .solid,
        isMaxWidth: Bool = false,
        isSelected: String = "",
        bgColor: ButtonLabelColor = .red
    ) {
        self.title = title
        self.style = style
        self.isMaxWidth = isMaxWidth
        self.isSelected = isSelected
        self.bgColor = bgColor
    }

    var body: some View {
        switch style {
        case .border:
            // button with border
            HStack {
                Spacer()

                // button title
                TextComponent(
                    text: title,
                    fontSize: 16,
                    fontColor: .red
                )

                Spacer()
            }
            .padding(.horizontal)
            .frame(maxWidth: isMaxWidth ? .infinity : UIScreen.main.bounds.width * 0.55, minHeight: 50)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(StaticColor.primaryRed), lineWidth: 1)
            }
            .foregroundColor(Color(StaticColor.primaryRed))
        case .solid:
            // solid button
            HStack {
                Spacer()

                // button title
                TextComponent(
                    text: title,
                    fontSize: 16,
                    fontColor: .white
                )

                Spacer()
            }
            .frame(maxWidth: isMaxWidth ? .infinity : UIScreen.main.bounds.width * 0.55, minHeight: 50)
            .background(Color(bgColor.rawValue), in: RoundedRectangle(cornerRadius: 10))
            .foregroundColor(.white)
        case .capsule:
            ZStack {
                if isSelected == title {
                    Capsule()
                        .fill(Color(StaticColor.primaryBlue))
                        .frame(width: 83, height: 37)
                } else {
                    Capsule()
                        .stroke(Color(StaticColor.primaryBlue), lineWidth: 1)
                        .frame(width: 83, height: 37)
                }
                
                // button title
                TextComponent(
                    text: title,
                    fontSize: 17,
                    fontColor: isSelected == title ? .white : .blue
                )
            }
        }
    }
}

struct ButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        ButtonComponent(title: "No", style: .solid, isSelected: "Yes")
    }
}
