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
    var startDate: Date
    var currentAmount: Double = 0
    var completionDates: [Date] = []
    var isCompletedToday: Bool {
        completionDates.contains{Calendar.current.isDateInToday($0)}
    }
    var streak: Int {
        var count = 0
        var day = Date.now
        while completionDates.contains(where: {Calendar.current.isDate($0, inSameDayAs: day)}) {
            count += 1
            day = Calendar.current.date(byAdding: .day, value: -1, to: day)!
        }
        return count
    }
    
    
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
    
    init( title: String, purposeAmount:Double, habitType: HabitType, startDate: Date = Date.now) {
        self.title = title
        self.purposeAmount = purposeAmount
        self.habitTypeRaw = habitType.rawValue
        self.startDate = startDate   }
    
    
}
enum HabitType:String, Codable {
    case build
    case reduce
}
