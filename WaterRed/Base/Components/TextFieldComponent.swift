//
//  TextFieldComponent.swift
//  WaterRed
//
//  Created by Rhymetech on 07/12/22.
//

import SwiftUI

// MARK: - Focus Field Cases

enum FocusedField {
    // signup
    case name
    case email
    case password, confirmPassword
    case phoneNo
    case lastDonation
    case diseases

    // select blood group
    case unit

    // previous donations
    case previousDonations
}

// MARK: - TextField Component

struct TextFieldComponent: View {
    // focus state
    @FocusState var focusedField: FocusedField?

    // data binding
    @Binding var text: String

    let placeholder: String
    let icon: String
    let focus: FocusedField

    var body: some View {
        HStack(spacing: 16) {
            Image(icon)

            Rectangle()
                .fill(Color(StaticColor.secondaryGray))
                .frame(maxWidth: 1, maxHeight: 32)

            ZStack(alignment: .leading) {
                // floating placeholder
                TextComponent(
                    text: placeholder,
                    fontSize: 12,
                    fontColor: .extraLight
                )
                .offset(y: focusedField == focus || !text.isEmpty ? -18 : 0)
                .scaleEffect(focusedField == focus || !text.isEmpty ? 0.9 : 1, anchor: .leading)

                // textfield
                if focus == .password {
                    SecureField("", text: $text)
                        .font(.custom(StaticFont.regular, size: 14))
                        .focused($focusedField, equals: focus)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                } else {
                    TextField("", text: $text)
                        .font(.custom(StaticFont.regular, size: 14))
                        .focused($focusedField, equals: focus)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .disabled(focus == .previousDonations)
                }
            }
            .animation(.easeOut(duration: 0.2), value: focusedField == focus)

            Spacer()
        }
        .padding(20)
        .background {
            Rectangle()
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.03), radius: 18, x: 10, y: 10)
        }
    }
}

struct TextFieldComponent_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(StaticColor.bgColor).ignoresSafeArea()
            VStack(spacing: 16) {
                TextFieldComponent(text: .constant(""), placeholder: "Email", icon: StaticImage.email, focus: .email)
            }
            .padding()
        }
    }
}
