//
//  PhoneVerificationView.swift
//  WaterRed
//
//  Created by Rhymetech on 07/12/22.
//

import SwiftUI

// MARK: - Phone Verification View

struct PhoneVerificationView: View {
    @EnvironmentObject private var sessionVM: SessionViewModelImpl
    @FocusState var focusedField: FocusedField?
    @State var phoneNo = ""
    let screenSize: CGSize
    var body: some View {
        ZStack {
            // background color
            Color(StaticColor.bgColor)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 30) {
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

                    // phone number textfield
                    TextFieldComponent(
                        focusedField: _focusedField,
                        text: $phoneNo,
                        placeholder: StaticText.phoneVerification,
                        icon: StaticImage.phone,
                        focus: .phoneNo
                    )

                    Spacer()

                    // get code button
                    Button {
                        sessionVM.isLoggedIn = true
                    } label: {
                        ButtonComponent(title: StaticText.getCode)
                    }

                    // bottom note
                    TextComponent(
                        text: StaticText.demoLabel,
                        fontColor: .light,
                        alignment: .center
                    )

                    Spacer()
                }
                .padding()
            }
        }
    }
}

struct PhoneVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneVerificationView(screenSize: UIScreen.main.bounds.size)
    }
}
