//
//  WaterRedApp.swift
//  WaterRed
//
//  Created by Rhymetech on 06/12/22.
//

import SwiftUI

@main
struct WaterRedApp: App {
    @StateObject private var sessionVM = SessionViewModelImpl()
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(sessionVM)
        }
    }
}
