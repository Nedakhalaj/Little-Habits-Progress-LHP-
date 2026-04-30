//
//  Model.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-04-30.
//
 import SwiftUI
import SwiftData

@Model
class HabitModel: Identifiable {
    var id = UUID()
    var title: String
    var purposeAmount: Double
    var habitType: HabitType
    var isCompleted: Bool
    
    
    init( title: String,purposeAmount:Double, isCompleted: Bool, habitType: HabitType) {
        self.title = title
        self.purposeAmount = purposeAmount
        self.isCompleted = isCompleted
        self.habitType = habitType
    }
    
    
}
enum HabitType:String, Codable {
    case build
    case reduce
}
