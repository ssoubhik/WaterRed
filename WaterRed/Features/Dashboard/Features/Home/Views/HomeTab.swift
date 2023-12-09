//
//  HomeTab.swift
//  WaterRed
//
//  Created by Sayan Samaddar on 11/12/22.
//

import SwiftUI

// MARK: - Home Tab View

struct HomeTab: View {
    @EnvironmentObject private var sessionVM: SessionViewModelImpl
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                // background color
                Color(StaticColor.bgColor)
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        // home screen title
                        TextComponent(
                            text: StaticText.giftOfLife,
                            fontSize: proxy.size.width * 0.05,
                            fontColor: .dark
                        )
                        
                        // home screen title 2
                        Text(StaticText.donate)
                            .font(.custom(StaticFont.regular, size: proxy.size.width * 0.1))
                            .foregroundColor(Color(StaticColor.primaryRed))
                        + Text(StaticText.now)
                            .font(.custom(StaticFont.bold, size: proxy.size.width * 0.1))
                            .foregroundColor(Color(StaticColor.primaryRed))
                        
                        // home screen stats
                        HStack(spacing: proxy.size.width * 0.07) {
                            // blood requested stats
                            HomeTabStats(
                                screenSize: proxy.size,
                                text: "157",
                                label: StaticText.newBloodRequest
                            )
                            
                            // lives saved stats
                            HomeTabStats(
                                screenSize: proxy.size,
                                text: "15K",
                                label: StaticText.livesSaved
                            )
                        }
                        .padding(.bottom, 8)
                        
                        // home screen subtitle
                        Text(StaticText.eachDonationsSaves)
                            .font(.custom(StaticFont.regular, size: proxy.size.width * 0.035))
                            .foregroundColor(Color(StaticColor.lightText))
                        + Text(StaticText.threeLives)
                            .font(.custom(StaticFont.bold, size: proxy.size.width * 0.035))
                            .foregroundColor(Color(StaticColor.lightText))
                        
                        // last updated date
                        HStack {
                            // label
                            TextComponent(
                                text: StaticText.lastUpdateOn,
                                fontSize: proxy.size.width * 0.03,
                                fontColor: .accent
                            )
                            
                            // date & time
                            TextComponent(
                                text: "8:05 PM, Fri, Oct 21, 2022",
                                fontSize: proxy.size.width * 0.03,
                                fontColor: .light
                            )
                        }
                        .padding(.top)
                        
                        // hometab buttons gridview
                        LazyVGrid(columns: columns, spacing: proxy.size.width * 0.075) {
                            ForEach(0..<StaticText.homeTabButtonList.count, id: \.self) { index in
                                // home tab button
                                HomeTabButtons(
                                    screenSize: proxy.size,
                                    index: index
                                )
                                .padding(.horizontal, proxy.size.width * 0.03)
                            }
                        }
                        .padding(.vertical)
                    }
                    .padding()
                }
            }
        }
    }
}

// MARK: - Home Tab Stats View

struct HomeTabStats: View {
    let screenSize: CGSize
    let text: String
    let label: String
    var body: some View {
        VStack {
            // stats
            TextComponent(
                text: text,
                fontSize: screenSize.width * 0.09,
                fontColor: label == StaticText.livesSaved ? .light : .white
            )

            // label
            TextComponent(
                text: label,
                fontSize: screenSize.width * 0.03,
                fontColor: label == StaticText.livesSaved ? .light : .white
            )
        }
        .padding(.vertical, screenSize.width * 0.045)
        .padding(.horizontal, screenSize.width * 0.065)
        .background(label == StaticText.livesSaved ? Color(StaticColor.offWhite) : Color(StaticColor.primaryRed), in: RoundedRectangle(cornerRadius: screenSize.width * 0.05))
    }
}

struct HomeTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}
