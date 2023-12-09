//
//  BloodGroupListView.swift
//  WaterRed
//
//  Created by Sayan Samaddar on 11/12/22.
//

import SwiftUI

// MARK: - Blood Group List View

struct BloodGroupListView: View {
    @Binding var selectedBloodGroup: String
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0..<StaticText.bloodGroups.count, id: \.self) { index in
                    BloodGroupView(
                        index: index,
                        selectedbloodGroup: $selectedBloodGroup
                    )
                }
            }
        }
    }
}

// MARK: - Blood Group View

struct BloodGroupView: View {
    let index: Int
    @Binding var selectedbloodGroup: String
    var body: some View {
        VStack {
            ZStack {
                // blood image
                Image(selectedbloodGroup == StaticText.bloodGroups[index] ? StaticImage.bloodSelected : StaticImage.blood)
                
                Circle()
                    .fill(Color(StaticColor.gray))
                    .frame(width: 30, height: 30)
                    .overlay {
                        Circle()
                            .stroke(.white, lineWidth: 1)
                    }
                    .overlay {
                        // blood group name
                        TextComponent(
                            text: StaticText.bloodGroups[index],
                            fontWeight: .bold,
                            fontSize: 12,
                            fontColor: .white
                        )
                    }
                    .offset(x: 12, y: -6)
            }
            
            // blood group description
            TextComponent(
                text: StaticText.bloodGroupDesc[index],
                fontSize: 12,
                fontColor: .light,
                alignment: .center,
                fixedSize: true
            )
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(StaticColor.primaryRed).opacity(0.6), lineWidth: 0.5)
        }
        .onTapGesture {
            withAnimation {
                selectedbloodGroup = StaticText.bloodGroups[index]
            }
        }
    }
}
