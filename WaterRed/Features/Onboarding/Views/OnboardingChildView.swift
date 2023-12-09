//
//  OnboardingChildView.swift
//  WaterRed
//
//  Created by Rhymetech on 06/12/22.
//

import SwiftUI

// MARK: - Onboarding Child View

struct OnboardingChildView: View {
    let screenSize: CGSize
    let index: Int
    var body: some View {
        VStack(spacing: 16) {
            // onboarding illustration
            Image(StaticImage.onboardingImgList[index])
                .resizable()
                .scaledToFit()
                .frame(maxHeight: screenSize.height * 0.5)

            // title
            TextComponent(
                text: StaticText.onboardingTitles[index],
                fontWeight: .medium,
                fontSize: 25,
                fontColor: .dark
            )

            // description
            TextComponent(
                text: StaticText.onboardingDescs[index],
                fontColor: .light,
                alignment: .center
            )

            Spacer()

            // let's begin button: navigate to landing view
            if index == 2 {
                NavigationLink {
                    LandingView()
                } label: {
                    ButtonComponent(title: StaticText.begin)
                }
            }

            Spacer()
        }
        .padding()
    }
}

struct OnboardingChildView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingChildView(screenSize: UIScreen.main.bounds.size, index: 2)
    }
}
