//
//  HealthQueryData.swift
//  WaterRed
//
//  Created by Sayan Samaddar on 11/12/22.
//

import SwiftUI

// MARK: - Health Query Data Model

struct HealthQueryData {
    let question: String
    var answer: String
    var description: String
    
    static var question1 = HealthQueryData(
        question:"Have you taken any immunization or other injections in the last 4 weeks?",
        answer: "",
        description: ""
    )
    static var question2 = HealthQueryData(
        question: "You or any family member treated for Hepatitis B or C in the past?",
        answer: "",
        description: ""
    )
    static var question3 = HealthQueryData(
        question: "Did you suffer from dengue in the last 6  months?",
        answer: "",
        description: ""
    )
    static var question4 = HealthQueryData(
        question: "Did you take any vaccine in the last 3 months?",
        answer: "",
        description: ""
    )
}
