//
//  HamburgerDetails.swift
//  WaterRed
//
//  Created by Rhymetech on 15/12/22.
//

import SwiftUI

// MARK: - Hamburger Details View

struct HamburgerDetails: View {
    let screenTitle: String
    var body: some View {
        switch screenTitle {
        case StaticText.hamburgerList[3]:
            // select blood group view
            SelectBloodGroupView()
        case StaticText.hamburgerList[4]:
            // donation guidelines view
            DonationGuidelinesView()
        case StaticText.hamburgerList[5]:
            // donation type view
            DonationTypeView()
        default:
            EmptyView()
        }
    }
}
