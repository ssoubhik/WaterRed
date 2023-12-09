//
//  SelectBloodGroupView.swift
//  WaterRed
//
//  Created by Rhymetech on 13/12/22.
//

import SwiftUI

// MARK: - Select Blood Group View

struct SelectBloodGroupView: View {
    @FocusState var focusedField: FocusedField?
    @State private var selectedBloodGroup = ""
    @State private var unitOfBlood = ""
    var body: some View {
        ZStack {
            // background color
            Color(StaticColor.bgColor)
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(spacing: 64) {
                    // blood group list
                    BloodGroupListView(selectedBloodGroup: $selectedBloodGroup)

                    // unit of blood textfield
                    TextFieldComponent(
                        focusedField: _focusedField,
                        text: $unitOfBlood,
                        placeholder: StaticText.unitOfBlood,
                        icon: StaticImage.pinkDrop,
                        focus: .unit
                    )

                    VStack(spacing: 20) {
                        // emergency button
                        NavigationLink {
                            DonatorsListView(
                                selectedBloodGroup: $selectedBloodGroup,
                                index: getBloodGroup()
                            )
                        } label: {
                            ButtonComponent(
                                title: StaticText.emergency,
                                isMaxWidth: true
                            )
                        }

                        // or textview
                        TextComponent(
                            text: StaticText.or,
                            fontColor: .light
                        )

                        // schedule button
                        HStack(spacing: 16) {
                            TextComponent(
                                text: StaticText.schedule,
                                fontColor: .light
                            )

                            // calendar icon
                            Image(StaticImage.blueCalendar)
                                .padding(20)
                                .background {
                                    Circle()
                                        .fill(Color(StaticColor.primaryBlue).opacity(0.2))
                                }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationTitle("")
        .toolbar {
            ToolbarItem(placement: .principal) {
                // screen title
                TextComponent(
                    text: StaticText.selectBloodGroup,
                    fontSize: 18,
                    fontColor: .accent
                )
            }
        }
    }

    // Method: get blood group
    func getBloodGroup() -> Int {
        let index = StaticText.bloodGroups.firstIndex(where: {$0 == selectedBloodGroup})
        return index ?? 0
    }
}

struct SelectBloodGroupView_Previews: PreviewProvider {
    static var previews: some View {
        SelectBloodGroupView()
    }
}
