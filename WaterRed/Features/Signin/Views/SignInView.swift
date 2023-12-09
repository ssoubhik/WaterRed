//
//  SignInView.swift
//  WaterRed
//
//  Created by Rhymetech on 07/12/22.
//

import SwiftUI

// MARK: - Sign In View

struct SignInView: View {
    @FocusState var focusedField: FocusedField?
    @State var email = ""
    @State var password = ""
    let screenSize: CGSize
    var body: some View {
        ZStack {
            // background color
            Color(StaticColor.bgColor)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: screenSize.height * 0.035) {
                    Spacer()

                    // water red logo
                    Image(StaticImage.waterRed)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: screenSize.width * 0.6)

                    Spacer()

                    // note
                    TextComponent(
                        text: StaticText.demoNote,
                        fontColor: .light,
                        alignment: .center
                    )

                    // email address textfield
                    TextFieldComponent(
                        focusedField: _focusedField,
                        text: $email,
                        placeholder: StaticText.email,
                        icon: StaticImage.email,
                        focus: .email
                    )

                    // password textfield
                    TextFieldComponent(
                        focusedField: _focusedField,
                        text: $password,
                        placeholder: StaticText.password,
                        icon: StaticImage.password,
                        focus: .password
                    )

                    Spacer()

                    // signin button: navigate to phone verification view
                    NavigationLink {
                        PhoneVerificationView(screenSize: screenSize)
                    } label: {
                        ButtonComponent(title: StaticText.signin)
                    }

                    // bottom note
                    TextComponent(
                        text: StaticText.demoLabel,
                        fontColor: .light,
                        alignment: .center
                    )

                    Spacer()
                }
                .padding(screenSize.width * 0.04)
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(screenSize: UIScreen.main.bounds.size)
    }
}
