//
//  HomeTabButtons.swift
//  WaterRed
//
//  Created by Rhymetech on 12/12/22.
//

import SwiftUI

// MARK: - Home Tab Buttons

struct HomeTabButtons: View {
    let screenSize: CGSize
    let index: Int
    let colors = [
        Color(StaticColor.pink),
        Color(StaticColor.yellow),
        Color(StaticColor.green),
        Color(StaticColor.lightGray)
    ]
    var body: some View {
        NavigationLink {
            HomeTabDetailsView(index: index)
        } label: {
            VStack {
                // icon
                Image(StaticImage.homeTabButtonImgs[index])
                    .resizable()
                    .scaledToFit()
                    .frame(width: screenSize.width * 0.06, height: screenSize.height * 0.04)
                    .padding(screenSize.width * 0.055)
                    .background(colors[index].opacity(0.2), in: Circle())

                // label
                TextComponent(
                    text: StaticText.homeTabButtonList[index],
                    fontSize: screenSize.width * 0.035
                )

                // label 2
                TextComponent(text: getLabel(), fontSize: screenSize.width * 0.03, fontColor: .white)
                    .padding(.vertical, screenSize.width * 0.009)
                    .padding(.horizontal, screenSize.width * 0.02)
                    .background(Color(StaticColor.primaryBlue), in: Capsule())
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, screenSize.width * 0.04)
            .background {
                RoundedRectangle(cornerRadius: screenSize.width * 0.03)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.03), radius: 18, x: 10, y: 10)
            }
        }
    }

    // Method: get label for button
    func getLabel() -> String {
        switch index {
        case 0:
            return "235K"
        case 1:
            return "500K"
        case 2:
            return StaticText.map
        case 3:
            return StaticText.more
        default:
            return ""
        }
    }
}
