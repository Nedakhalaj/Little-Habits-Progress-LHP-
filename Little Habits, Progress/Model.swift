//
//  Model.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-04-30.
//
 import Foundation
import SwiftData

@Model
class HabitModel {
    var id = UUID()
    var newHabit: String
    var purposeAmount: Double
    var habitTypeRaw: String
    var isCompleted: Bool
    
    
    var habitType: HabitType {
        get{
            HabitType(rawValue: habitTypeRaw) ?? .build
        }
        set{
            habitTypeRaw = newValue.rawValue
        }
    }
    
    init( title: String, purposeAmount:Double, habitType: HabitType) {
        self.newHabit = title
        self.purposeAmount = purposeAmount
        self.isCompleted = false
        self.habitTypeRaw = habitType.rawValue    }
    
    
}
enum HabitType:String, Codable {
    case build
    case reduce
}
