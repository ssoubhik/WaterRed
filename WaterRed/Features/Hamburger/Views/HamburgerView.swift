//
//  HamburgerView.swift
//  WaterRed
//
//  Created by Rhymetech on 14/12/22.
//

import SwiftUI

// MARK: - Hamburger View

struct HamburgerView: View {
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                // background color
                Color(StaticColor.bgColor)
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 12) {
                        ZStack {
                            // background red color
                            Color(StaticColor.primaryRed)
                                .frame(maxWidth: proxy.size.width * 0.3)

                            // user's profile image
                            Image("demo_pic")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64, height: 64)
                                .padding(.top, proxy.size.width * 0.14)
                        }

                        VStack(alignment: .leading) {
                            // user's name
                            TextComponent(
                                text: "Telon Husk",
                                fontWeight: .bold,
                                fontSize: 20,
                                fontColor: .accent
                            )

                            // edit details button
                            Button {
                                // action
                            } label: {
                                TextComponent(
                                    text: "Edit Details",
                                    fontColor: .light
                                )
                            }
                        }
                        .padding(.top, proxy.size.width * 0.14)
                    }

                    // hamburger list
                    ForEach(0..<StaticText.hamburgerList.count, id: \.self) { index in
                        // hamburger list row
                        HamburgerListRow(screenSize: proxy.size, index: index)
                    }

                    // empty spacer with red background
                    HStack {
                        Color(StaticColor.primaryRed)
                            .frame(maxWidth: proxy.size.width * 0.3)

                        Spacer()
                    }

                    // logout button
                    HStack(spacing: 12) {
                        ZStack {
                            // red background
                            Color(StaticColor.primaryRed)
                                .frame(maxWidth: proxy.size.width * 0.3)

                            // logout icon
                            Image(StaticImage.logout)
                        }

                        Button {
                            // action
                        } label: {
                            // logout label
                            TextComponent(
                                text: "Log out",
                                fontColor: .accent
                            )

                            Spacer()
                        }
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
}

struct HamburgerView_Previews: PreviewProvider {
    static var previews: some View {
        HamburgerView()
    }
}

// MARK: - Hamburger List Row View

struct HamburgerListRow: View {
    @EnvironmentObject private var sessionVM: SessionViewModelImpl
    let screenSize: CGSize
    let index: Int
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                // red background
                Color(StaticColor.primaryRed)
                    .frame(width: screenSize.width * 0.3, height: screenSize.height * 0.1)

                // icon
                Image(StaticImage.hamburgerIcons[index])
            }

            Button {
                // close hamburger menu
                sessionVM.hamburgerControls.showHamburgerMenu = false

                if index == 2 {
                    // redirect to notification screen
                    sessionVM.currentTab = Tabs.notification
                } else if index == 6 {
                    sessionVM.currentTab = Tabs.settings
                } else {
                    // programatically navigate to hamburger detail screen
                    sessionVM.hamburgerControls.isHamburgerNavigationActive = true
                    sessionVM.hamburgerControls.hamburgerNavigationTitle = StaticText.hamburgerList[index]
                }
            } label: {
                // label
                TextComponent(
                    text: StaticText.hamburgerList[index],
                    fontColor: .accent
                )

                Spacer()

                // right arrow icon
                Image(systemName: StaticImage.arrowRight)
                    .font(.system(size: 10))
                    .foregroundColor(Color(StaticColor.lightGray))
                    .padding(.trailing)

            }
        }
    }
}
