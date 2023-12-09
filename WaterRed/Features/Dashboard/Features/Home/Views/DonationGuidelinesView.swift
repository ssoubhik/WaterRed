//
//  DonationGuidelinesView.swift
//  WaterRed
//
//  Created by Rhymetech on 13/12/22.
//

import SwiftUI

struct DonationGuidelinesView: View {
    var body: some View {
        ZStack {
            Color(StaticColor.bgColor)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 16) {
                    VStack(alignment: .leading) {
                        // chapter 1 textview
                        TextComponent(
                            text: "Chapter 1",
                            fontSize: 12,
                            fontColor: .yellow
                        )
                        
                        // general guidelines textview
                        TextComponent(
                            text: "General Guidelines for Blood Donation",
                            fontSize: 20,
                            fontColor: .accent
                        )
                    }
                    
                    VStack(alignment: .leading, spacing: 0) {
                        // 1
                        GeneralGuidelines(
                            guideline: "Be in good general health and feeling well.",
                            isChecked: true
                        )

                        // 2
                        GeneralGuidelines(guideline: "Be at least 17 years old in most states (16 years old with parental consent in some states).")

                        // 3
                        GeneralGuidelines(guideline: "Weigh at least 110 pounds. Additional weight requirements apply for donors 18 years old and younger and all high school donors.")

                        // 4
                        GeneralGuidelines(
                            guideline: "Have not donated blood in the last 56 days.",
                            isLastGuideline: true
                        )
                    }
                    .padding(24)
                    .background {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.03), radius: 18, x: 10, y: 10)
                    }

                    TextComponent(
                        text: "How to Get Ready",
                        fontSize: 20,
                        fontColor: .accent
                    )
                    .padding(.top, 12)

                    TextComponent(
                        text: "Donors must have proof of age to ensure they meet the minimum age requirements and present a primary form of ID or two secondary forms of ID.",
                        fontColor: .light,
                        alignment: .center
                    )

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0...3, id: \.self) { _ in
                                DonationPreperationCard()
                            }
                        }
                    }

                    TextComponent(
                        text: "Whatever your reason, the need for blood is constant and you will feel good knowing your donation can help save up to 3 lives.\n\nBlood types are determined by the presence or absence of certain antigens – substances that can trigger an immune response if they are foreign to the body.  Since some antigens can trigger a patient's immune system to attack the transfused blood, safe blood transfusions depend on careful blood typing and cross-matching. Do you know what blood type is safe for you if you need a transfusion?",
                        fontColor: .light
                    )
                    .padding(.top)
                }
                .padding()
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                // screen title
                TextComponent(
                    text: StaticText.guidelinesForDonation,
                    fontSize: 18,
                    fontColor: .accent
                )
            }
        }
    }
}

struct DonationGuidelinesView_Previews: PreviewProvider {
    static var previews: some View {
        DonationGuidelinesView()
    }
}

// MARK: - General Guidelines

struct GeneralGuidelines: View {
    let guideline: String
    let isChecked: Bool
    let isLastGuideline: Bool

    internal init(
        guideline: String,
        isChecked: Bool = false,
        isLastGuideline: Bool = false
    ) {
        self.guideline = guideline
        self.isChecked = isChecked
        self.isLastGuideline = isLastGuideline
    }

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(spacing: 0) {
                Circle()
                    .fill(isChecked ? Color(StaticColor.green) : Color(StaticColor.bullet))
                    .frame(width: 8, height: 8)

                if !isLastGuideline {
                    Rectangle()
                        .fill(Color(StaticColor.bullet))
                        .frame(maxWidth: 1)
                }
            }
            .offset(y: 4)

            TextComponent(
                text: guideline,
                fontColor: .light
            )
            .padding(.bottom, isLastGuideline ? 0 : 16)
        }
    }
}

// MARK: - Donation Preperation Card

struct DonationPreperationCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 16) {
                Circle()
                    .fill(Color(StaticColor.primaryBlue))
                    .frame(width: 74, height: 74)
                    .overlay {
                        Image(StaticImage.glass)
                    }

                VStack(alignment: .leading) {
                    TextComponent(
                        text: "Step 1",
                        fontSize: 12,
                        fontColor: .light
                    )

                    TextComponent(
                        text: "Drink Extra Liquids",
                        fontSize: 16,
                        fontColor: .accent
                    )
                }

                Spacer()
            }

            TextComponent(
                text: "Drink an extra 16 oz. of water before your appointment",
                fontSize: 12,
                fontColor: .accent
            )
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.03), radius: 18, x: 10, y: 10)
        }
    }
}
