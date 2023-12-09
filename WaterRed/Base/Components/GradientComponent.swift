//
//  GradientComponent.swift
//  WaterRed
//
//  Created by Rhymetech on 11/12/22.
//

import SwiftUI

// MARK: - Gradient Colors

enum GradientColors: String {
    case red = "primary_red"
    case redShadow = "red_shadow"
    case pink
}

// MARK: - Gradient Component

struct GradientComponent: View {
    let lightColor: GradientColors
    let darkColor: GradientColors
    let shadowColor: GradientColors
    let startPoint: UnitPoint
    let endPoint: UnitPoint
    let cornerRadius: CGFloat

    internal init(
        lightColor: GradientColors = .pink,
        darkColor: GradientColors = .red,
        shadowColor: GradientColors = .redShadow,
        startPoint: UnitPoint = .topLeading,
        endPoint: UnitPoint = .bottomTrailing,
        cornerRadius: CGFloat = 0
    ) {
        self.lightColor = lightColor
        self.darkColor = darkColor
        self.shadowColor = shadowColor
        self.startPoint = startPoint
        self.endPoint = endPoint
        self.cornerRadius = cornerRadius
    }

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color(lightColor.rawValue), Color(darkColor.rawValue)]),
            startPoint: startPoint,
            endPoint: endPoint
        )
        .cornerRadius(cornerRadius)
        .shadow(color: Color(shadowColor.rawValue), radius: 8)
    }
}

struct GradientComponent_Previews: PreviewProvider {
    static var previews: some View {
        GradientComponent()
    }
}
