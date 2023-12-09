//
//  HomeTabDetailsView.swift
//  WaterRed
//
//  Created by Rhymetech on 13/12/22.
//

import SwiftUI

// MARK: - Home Tab Details View

struct HomeTabDetailsView: View {
    let index: Int
    var body: some View {
        switch index {
        case 0:
            SelectBloodGroupView()
        case 1:
            EmptyView()
        case 2:
            EmptyView()
        case 3:
            EmptyView()
        default:
            EmptyView()
        }
    }
}
