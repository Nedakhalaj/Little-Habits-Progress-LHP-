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
            guard let previous = Calendar.current.date(byAdding: .day, value: -1, to: day) else { break }
            day = previous
            if count > 3650 { break }
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
        let last7 = (0..<7).compactMap {
            Calendar.current.date(byAdding: .day, value: -$0, to: Date.now)
        }
        let completedDays = last7.filter { day in
            completionDates.contains { Calendar.current.isDate($0, inSameDayAs: day) }
        }.count
        return Double(completedDays) / 7.0 * 100
    }
    
    
    init( title: String, purposeAmount:Double, habitType: HabitType, startDate: Date = Date.now) {
        self.title = title
        self.purposeAmount = purposeAmount
        self.habitTypeRaw = habitType.rawValue
        self.startDate = startDate
        self.completionDates = []
    }
    
    
}
enum HabitType:String, Codable {
    case build
    case reduce
}
