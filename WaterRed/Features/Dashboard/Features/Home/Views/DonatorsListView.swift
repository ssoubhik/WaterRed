//
//  DonatorsListView.swift
//  WaterRed
//
//  Created by Rhymetech on 13/12/22.
//

import SwiftUI

// MARK: - Donators List View

struct DonatorsListView: View {
    @Binding var selectedBloodGroup: String
    let index: Int
    var body: some View {
        ZStack {
            // background color
            Color(StaticColor.bgColor)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 16) {
                    // blood group view
                    BloodGroupView(
                        index: index,
                        selectedbloodGroup: $selectedBloodGroup
                    )

                    // number of results available
                    TextComponent(
                        text: "Your 25 request available !",
                        fontColor: .accent
                    )
                    .padding(.vertical)

                    // donators list
                    ForEach(0...24, id: \.self) { _ in
                        NavigationLink {
                            // navigate to donator's profile view
                            DonorProfileView()
                        } label: {
                            // donators list row
                            DonatorsListRow()
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("")
    }
}

struct DonatorsListView_Previews: PreviewProvider {
    static var previews: some View {
        DonatorsListView(selectedBloodGroup: .constant(""), index: 0)
    }
}

// MARK: - Donators List Row View

struct DonatorsListRow: View {
    var body: some View {
        HStack {
            // donator's profile picture
            Image("demo_pic")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)

            VStack(alignment: .leading, spacing: 4) {
                // donator's name
                TextComponent(
                    text: "Alena Mango",
                    fontSize: 17,
                    fontColor: .accent
                )

                HStack {
                    // location icon
                    Image(StaticImage.location2)

                    // donator's location
                    TextComponent(
                        text: "RT Nagar",
                        fontSize: 12,
                        fontColor: .light
                    )
                }
            }

            Spacer()

            // donator's disctance
            TextComponent(
                text: "5km",
                fontWeight: .bold,
                fontSize: 12,
                fontColor: .white
            )
            .padding(.vertical, 8)
            .padding(.horizontal, 6)
            .background(Color.purple, in: RoundedRectangle(cornerRadius: 7))
        }
        .padding()
        .background {
            Rectangle()
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.03), radius: 18, x: 10, y: 10)
        }
    }
}
