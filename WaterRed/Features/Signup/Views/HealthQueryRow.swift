//
//  HealthQueryRow.swift
//  WaterRed
//
//  Created by Sayan Samaddar on 11/12/22.
//

import SwiftUI

// MARK: - Health Questions Row

struct HealthQueryRow: View {
    @Binding var query: HealthQueryData
    var body: some View {
        HStack(alignment: .top) {
            Circle()
                .fill(Color(StaticColor.bullet))
                .frame(width: 8, height: 8)
                .offset(y: 5)
            
            VStack(alignment: .leading, spacing: 16) {
                // question
                TextComponent(
                    text: query.question,
                    fontColor: .light
                )
                
                HStack(spacing: 18) {
                    // no button
                    Button {
                        query.answer = StaticText.no
                    } label: {
                        ButtonComponent(
                            title: StaticText.no,
                            style: .capsule,
                            isSelected: query.answer
                        )
                    }
                    
                    // yes button
                    Button {
                        query.answer = StaticText.yes
                    } label: {
                        ButtonComponent(
                            title: StaticText.yes,
                            style: .capsule,
                            isSelected: query.answer
                        )
                    }
                }
            }

            Spacer()
        }
    }
}
