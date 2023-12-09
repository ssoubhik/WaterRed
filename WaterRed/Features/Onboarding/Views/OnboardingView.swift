//
//  OnboardingView.swift
//  WaterRed
//
//  Created by Rhymetech on 06/12/22.
//

import SwiftUI

// MARK: - Onboarding View

struct OnboardingView: View {
    init() {
        // change tabview page indicator color
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(named: StaticColor.primaryRed)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(named: StaticColor.secondaryGray)
    }
    var body: some View {
        GeometryReader { proxy in
            NavigationView {
                ZStack {
                    // background color
                    Color(StaticColor.bgColor)
                        .ignoresSafeArea()

                    // paging tabview
                    TabView {
                        ForEach(0..<StaticImage.onboardingImgList.count, id: \.self) { index in
                            // child view
                            OnboardingChildView(
                                screenSize: proxy.size,
                                index: index
                            )
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                }
            }
            .navigationViewStyle(.stack)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
