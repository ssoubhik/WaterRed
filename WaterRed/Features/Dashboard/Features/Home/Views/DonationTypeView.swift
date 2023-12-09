//
//  DonationTypeView.swift
//  WaterRed
//
//  Created by Rhymetech on 13/12/22.
//

import SwiftUI

// MARK: - Donation Type View

struct DonationTypeView: View {
    let columns = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible(), spacing: 0)
    ]
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color(StaticColor.bgColor)
                ScrollView(showsIndicators: false) {
                    VStack {
                        ZStack(alignment: .bottom) {
                            Color(StaticColor.primaryRed)
                                .cornerRadius(radius: 40, corners: .bottomLeft)

                            Image(StaticImage.donation)
                                .resizable()
                                .scaledToFit()
                        }
                        .frame(width: proxy.size.width, height: proxy.size.height * 0.5)

                        LazyVGrid(columns: columns, spacing: 24) {
                            ForEach(0..<StaticText.homeTabButtonList.count, id: \.self) { index in
                                // home tab button
                                DonattionTypeButtons(
                                    screenSize: proxy.size,
                                    index: index
                                )
                                .padding(.horizontal, 12)
                            }
                        }
                        .padding(.top, 20)
                        .padding()

                        // next button
                        NavigationLink {
                            DonationGuidelinesView()
                        } label: {
                            ButtonComponent(
                                title: StaticText.next,
                                bgColor: .blue
                            )
                        }
                    }
                    .padding(.bottom, 32)
                }
            }
            .ignoresSafeArea()
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    // screen title
                    TextComponent(
                        text: StaticText.donationType,
                        fontSize: 18,
                        fontColor: .accent
                    )
                }
            }
        }
    }
}

struct DonationTypeView_Previews: PreviewProvider {
    static var previews: some View {
        DonationTypeView()
    }
}

// MARK: - Donation Type Buttons

struct DonattionTypeButtons: View {
    let screenSize: CGSize
    let index: Int
    var body: some View {
        Button {
            // action
        } label: {
            VStack {
                // icon
                Image(StaticImage.pinkDrop)
                    .padding(20)
                    .background(Color(StaticColor.primaryRed).opacity(0.2), in: Circle())

                // label
                TextComponent(
                    text: StaticText.donationTypes[index],
                    fontSize: 16
                )

                // label 2
                TextComponent(
                    text: "Do you want to make your contact number visible for other",
                    fontSize: 12,
                    fontColor: .light,
                    alignment: .center
                )
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.03), radius: 18, x: 10, y: 10)
            }
        }
    }
}
