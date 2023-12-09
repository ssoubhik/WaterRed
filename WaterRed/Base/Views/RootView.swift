//
//  RootView.swift
//  WaterRed
//
//  Created by Soubhik Sarkhel on 01/08/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var sessionVM: SessionViewModelImpl
    var body: some View {
        if sessionVM.isLoggedIn {
            DashboardView()
        } else {
            OnboardingView()
        }
    }
}
