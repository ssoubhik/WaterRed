//
//  TabBar.swift
//  WaterRed
//
//  Created by Sayan Samaddar on 11/12/22.
//

import SwiftUI

// MARK: - Tab Bar View

struct TabBar: View {
    @State private var isSelected = Tabs.home
    var body: some View {
        HStack(spacing: 0) {
            // home
            TabBarButton(
                isSelected: $isSelected,
                tab: .home,
                tabIcon: StaticImage.home
            )
            
            // profile
            TabBarButton(
                isSelected: $isSelected,
                tab: .profile,
                tabIcon: StaticImage.profile
            )
            
            // blood drop button
            NavigationLink {
                DonationTypeView()
            } label: {
                Image(StaticImage.bloodDrop)
                    .padding(.horizontal, 18)
                    .padding(.vertical, 17)
                    .background {
                        GradientComponent(cornerRadius: 15)
                    }
            }
            .offset(y: -34)
            .frame(maxWidth: .infinity)
            
            // notification
            TabBarButton(
                isSelected: $isSelected,
                tab: .notification,
                tabIcon: StaticImage.notification
            )
            
            // settings
            TabBarButton(
                isSelected: $isSelected,
                tab: .settings,
                tabIcon: StaticImage.settings
            )
        }
        .padding(.vertical, 10)
        .background {
            Rectangle()
                .fill(Color.white)
                .shadow(color: .black.opacity(0.06), radius: 10, x: 0, y: 0)
                .mask(Rectangle().padding(.top, -20))
        }
    }
}

// MARK: - Tab Bar Button View

struct TabBarButton: View {
    @EnvironmentObject private var sessionVM: SessionViewModelImpl
    @Binding var isSelected: Tabs
    let tab: Tabs
    let tabIcon: String
    
    var body: some View {
        Button {
            withAnimation(.spring()) {
                sessionVM.currentTab = tab
                isSelected = tab
            }
        } label: {
            VStack {
                Image(tabIcon)
                    .renderingMode(.template)
                    .foregroundColor(sessionVM.currentTab == tab ? Color(StaticColor.pink) : Color(StaticColor.gray))
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(alignment: .bottom) {
            Color.white
            TabBar()
        }
    }
}
