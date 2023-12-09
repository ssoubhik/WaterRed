//
//  SignUpView.swift
//  WaterRed
//
//  Created by Rhymetech on 07/12/22.
//

import SwiftUI

// MARK: - Signup View

struct SignUpView: View {
    @FocusState var focusedField: FocusedField?
    @State var name = ""
    @State var email = ""
    @State var lastDonation = ""
    @State var diseases = ""
    @State private var selectedBloodGroup = ""
    @State private var healthQueries: [HealthQueryData] = [.question1, .question2, .question3, .question4]
    let screenSize: CGSize
    var body: some View {
        ZStack {
            // background color
            Color(StaticColor.bgColor)
                .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // donor image
                    Image(StaticImage.donor)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: screenSize.height * 0.3)

                    // name textfield
                    TextFieldComponent(
                        focusedField: _focusedField,
                        text: $name,
                        placeholder: StaticText.name,
                        icon: StaticImage.user,
                        focus: .name
                    )

                    // email textfield
                    TextFieldComponent(
                        focusedField: _focusedField,
                        text: $email,
                        placeholder: StaticText.email,
                        icon: StaticImage.email,
                        focus: .email
                    )

                    // select blood group text
                    TextComponent(
                        text: StaticText.selectBloodGroup,
                        fontSize: 24
                    )

                    // blood group list view
                    BloodGroupListView(selectedBloodGroup: $selectedBloodGroup)

                    Group {
                        // fill details text
                        TextComponent(
                            text: StaticText.fillDetails,
                            fontSize: 24
                        )

                        // last donation date textfield
                        TextFieldComponent(
                            focusedField: _focusedField,
                            text: $lastDonation,
                            placeholder: StaticText.lastDonation,
                            icon: StaticImage.calendar,
                            focus: .lastDonation
                        )

                        // diseases textfield
                        TextFieldComponent(
                            focusedField: _focusedField,
                            text: $diseases,
                            placeholder: StaticText.anyDiseases,
                            icon: StaticImage.exclamation,
                            focus: .diseases
                        )

                        // health questions
                        VStack(alignment: .leading, spacing: 32) {
                            ForEach($healthQueries, id: \.question) { query in
                                HealthQueryRow(query: query)
                            }
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .shadow(color: Color.black.opacity(0.03), radius: 18, x: 10, y: 10)
                        }
                    }

                    // submit button
                    ButtonComponent(
                        title: StaticText.submit,
                        isMaxWidth: true
                    )

                    // read more button
                    Button {
                        // action
                    } label: {
                        TextComponent(
                            text: StaticText.readMoreToDonate,
                            fontColor: .blue
                        )
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(screenSize: UIScreen.main.bounds.size)
    }
}
