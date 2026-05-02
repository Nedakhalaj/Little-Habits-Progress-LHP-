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
    var title: String
    var purposeAmount: Double
    var habitTypeRaw: String
    var isCompleted: Bool
    var currentAmount: Double = 0
    
    
    var habitType: HabitType {
        get{
            HabitType(rawValue: habitTypeRaw) ?? .build
        }
        set{
            habitTypeRaw = newValue.rawValue
        }
    }
    var progress: Double {
        guard purposeAmount > 0 else { return 0 }
        return (currentAmount / purposeAmount) * 100
    }
    
    init( title: String, purposeAmount:Double, habitType: HabitType) {
        self.title = title
        self.purposeAmount = purposeAmount
        self.isCompleted = false
        self.habitTypeRaw = habitType.rawValue    }
    
    
}
enum HabitType:String, Codable {
    case build
    case reduce
}
