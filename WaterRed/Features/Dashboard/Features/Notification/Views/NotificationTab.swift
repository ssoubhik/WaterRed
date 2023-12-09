//
//  NotificationTab.swift
//  WaterRed
//
//  Created by Sayan Samaddar on 11/12/22.
//

import SwiftUI

// MARK: - Notification Tab View

struct NotificationTab: View {
    @EnvironmentObject private var sessionVM: SessionViewModelImpl
    var body: some View {
        ZStack {
            // background color
            Color(StaticColor.bgColor)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 16) {
                    // notifications list
                    ForEach(0...10, id: \.self) { _ in
                        // notification list row
                        NotificationsListRow()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("")
    }
}

struct NotificationTab_Previews: PreviewProvider {
    static var previews: some View {
        NotificationTab()
    }
}

// MARK: - Notifications List Row View

struct NotificationsListRow: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                // notification
                TextComponent(
                    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                    fontColor: .accent
                )

                // time
                TextComponent(
                    text: "2 min",
                    fontSize: 10,
                    fontColor: .light
                )
            }

            Spacer()

            // blood drops icon
            Image(StaticImage.bloodDrops)
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.03), radius: 18, x: 10, y: 10)
        }
    }
}
