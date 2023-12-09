//
//  DonorProfileView.swift
//  WaterRed
//
//  Created by Rhymetech on 13/12/22.
//

import SwiftUI

struct DonorProfileView: View {
    @FocusState var focusedField: FocusedField?
    @State var previousDonation = "13-12-2022"
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                // background color
                Color(StaticColor.bgColor)

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        // cover image & profile image
                        ZStack(alignment: .bottom) {
                            // cover image
                            Image("demo_cover")
                                .resizable()
                                .scaledToFill()
                                .frame(height: proxy.size.height * 0.3)
                                .clipped()

                            // profile image view
                            ProfileImageView()
                        }

                        // donor's name textview
                        TextComponent(
                            text: "Alena Mango",
                            fontSize: 20,
                            fontColor: .accent
                        )
                        .padding(.top, 48)

                        // blood group textview
                        TextComponent(
                            text: "A positive (A+)",
                            fontSize: 12,
                            fontColor: .light
                        )

                        HStack {
                            TextComponent(
                                text: "Request Now",
                                fontColor: .white
                            )
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(Color(StaticColor.primaryRed), in: Capsule())

                            Image(StaticImage.chat)
                                .padding(.vertical, 9)
                                .padding(.horizontal, 18)
                                .background {
                                    Capsule()
                                        .stroke(Color(StaticColor.primaryBlue).opacity(0.5), lineWidth: 1)
                                }
                        }

                        VStack(alignment: .leading, spacing: 4) {
                            TextComponent(
                                text: "I am more than willing to donate my WaterRed, please contact me or whatsapp.",
                                fontColor: .accent
                            )
                            .padding(.bottom, 8)

                            HStack {
                                Image(StaticImage.location2)

                                TextComponent(text: "Anand Rao Circle", fontSize: 12, fontColor: .light)

                                Spacer()
                            }

                            HStack {
                                Image(StaticImage.gender)

                                TextComponent(text: "Male, 47 age", fontSize: 12, fontColor: .light)

                                Spacer()
                            }
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .shadow(color: Color.black.opacity(0.03), radius: 18, x: 10, y: 10)
                        }
                        .padding(.horizontal)

                        // previous donations textview
                        HStack {
                            TextComponent(
                                text: "Previous Donations",
                                fontSize: 24,
                                fontColor: .accent
                            )

                            Spacer()
                        }
                        .padding(.leading)
                        .padding(.top, 8)

                        ForEach(0...4, id: \.self) { _ in
                            TextFieldComponent(
                                focusedField: _focusedField,
                                text: $previousDonation,
                                placeholder: "December ‘22",
                                icon: StaticImage.calendar,
                                focus: .previousDonations
                            )
                            .padding(.horizontal)
                        }
                    }
                    .padding(.bottom)
                }
            }
            .ignoresSafeArea()
        }
    }
}

struct DonorProfileView_Previews: PreviewProvider {
    static var previews: some View {
        DonorProfileView()
    }
}

// MARK: - Profile Image View

struct ProfileImageView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            // profile image
            Image("demo_pic")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)

            ZStack {
                // blood drop image
                Image(StaticImage.bloodSelected)
                    .resizable()
                    .scaledToFit()

                // blood group
                Circle()
                    .fill(Color(StaticColor.gray))
                    .frame(width: 26, height: 26)
                    .overlay {
                        Circle()
                            .stroke(.white, lineWidth: 1)
                    }
                    .overlay {
                        // blood group name
                        TextComponent(
                            text: "A+",
                            fontWeight: .bold,
                            fontSize: 10,
                            fontColor: .white
                        )
                    }
                    .offset(x: 12, y: -6)
            }
            .frame(width: 32, height: 45)
        }
        .offset(y: 50)
    }
}
