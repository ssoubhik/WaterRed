//
//  DashboardView.swift
//  WaterRed
//
//  Created by Sayan Samaddar on 11/12/22.
//

import SwiftUI

// MARK: - Tabs

enum Tabs: String {
    case home
    case profile
    case notification
    case settings
}

// MARK: - Dashboard View

struct DashboardView: View {
    @EnvironmentObject private var sessionVM: SessionViewModelImpl
    init() {
        // hide default tab bar
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TabView(selection: $sessionVM.currentTab) {
                    // home tab
                    HomeTab()
                        .tag(Tabs.home)

                    // appointment tab
                    ProfileTab()
                        .tag(Tabs.profile)

                    // connect tab
                    NotificationTab()
                        .tag(Tabs.notification)

                    // nearest tab
                    SettingsTab()
                        .tag(Tabs.settings)
                }

                // custom tab bar
                TabBar()

                // navigate to hamburger details screen
                NavigationLink(isActive: $sessionVM.hamburgerControls.isHamburgerNavigationActive) {
                    HamburgerDetails(screenTitle: sessionVM.hamburgerControls.hamburgerNavigationTitle)
                } label: {
                    EmptyView()
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // navbar leading item
                ToolbarItem(placement: .navigationBarLeading) {
                    if sessionVM.currentTab == .home {
                        HStack {
                            // location icon
                            Image(StaticImage.location)

                            // location name
                            TextComponent(
                                text: "Bengaluru",
                                fontColor: .accent
                            )
                        }
                    }
                }

                // screen title
                ToolbarItem(placement: .principal) {
                    TextComponent(
                        text: getScreenTitle(),
                        fontSize: 18,
                        fontColor: .accent
                    )
                }

                // navbar trailing item
                ToolbarItem(placement: .navigationBarTrailing) {
                    // menu icon
                    Button {
                        sessionVM.hamburgerControls.showHamburgerMenu = true
                    } label: {
                        Image(StaticImage.menu)
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .slideInView(isActive: $sessionVM.hamburgerControls.showHamburgerMenu, paddingPercentage: 0.2) {
            HamburgerView()
        }
    }

    // Method: get screen title
    func getScreenTitle() -> String {
        switch sessionVM.currentTab {
        case .notification:
            return StaticText.notification
        case .settings:
            return StaticText.settings
        case .home, .profile:
            return ""
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
