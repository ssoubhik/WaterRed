//
//  LandingView.swift
//  WaterRed
//
//  Created by Rhymetech on 07/12/22.
//

import SwiftUI

// MARK: - Landing View

struct LandingView: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                // background color
                Color(StaticColor.bgColor)
                    .ignoresSafeArea()

                VStack(spacing: 30) {
                    Spacer()

                    // water red logo
                    Image(StaticImage.waterRed)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.6)

                    Spacer()

                    // note
                    TextComponent(
                        text: StaticText.demoNote,
                        fontColor: .light,
                        alignment: .center
                    )

                    // signup button: navigate to signup view
                    NavigationLink {
                        SignUpView(screenSize: proxy.size)
                    } label: {
                        ButtonComponent(title: StaticText.signup, style: .border)
                    }

                    // signin button: navigate to signin view
                    NavigationLink {
                        SignInView(screenSize: proxy.size)
                    } label: {
                        ButtonComponent(title: StaticText.signin)
                    }

                    Spacer()

                    // bottom note
                    TextComponent(
                        text: StaticText.demoNote,
                        fontColor: .light,
                        alignment: .center
                    )

                    Spacer()
                }
            }
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
