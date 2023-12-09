//
//  SessionViewModel.swift
//  WaterRed
//
//  Created by Rhymetech on 14/12/22.
//

import SwiftUI

final class SessionViewModelImpl: ObservableObject {
    @AppStorage(StorageKeys.isLoggedIn) var isLoggedIn = false
    @Published var currentTab = Tabs.home
    @Published var hamburgerControls = HamburgerControls.new
}
