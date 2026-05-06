//
//  StatsView.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-04-30.
//

import SwiftUI
import SwiftData
import Charts

struct StatsView: View {
    @Query var query: [HabitModel]
    
    var last7Days: [Date] {
        Array((0..<7)
            .compactMap { Calendar.current.date(byAdding: .day, value: -$0, to: Date.now) }
            .reversed())
    }
    
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            VStack{
                ScrollView {
                    VStack {
                        Text("Streak")
                            .font(.title)
                            .padding()
                        
                        ForEach(query) {item in
                            HabitProgressCard(habit:item)
                            
                        }
                        
                    }
                    
                }
                Chart {
                    ForEach(query) { habit in
                        ForEach(Array(last7Days.enumerated()), id: \.offset) { index, day in
                            LineMark(
                                x: .value("Day", day, unit: .day),
                                y: .value("Completions", cumulativeCount(for: habit, upToIndex: index)),
                                series: .value("Habit", habit.title)
                            )
                            .foregroundStyle(by: .value("Habit", habit.title))
                            .interpolationMethod(.catmullRom)
                            
                            PointMark(
                                x: .value("Day", day, unit: .day),
                                y: .value("Completions", cumulativeCount(for: habit, upToIndex: index))
                            )
                            .foregroundStyle(by: .value("Habit", habit.title))
                        }
                    }
                }
                
            }
        }
    }
    func cumulativeCount(for habit: HabitModel, upToIndex index: Int) -> Int {
        last7Days.prefix(index + 1).filter { d in
            habit.completionDates.contains {
                Calendar.current.isDate($0, inSameDayAs: d)
            }
        }.count
    }
}


struct HabitProgressCard: View {
    var habit: HabitModel
    
    var last7Days: [Date] {
        Array((0..<7)
            .compactMap { Calendar.current.date(byAdding: .day, value: -$0, to: Date.now) }
            .reversed())
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(habit.title)
                    .font(.headline)
                Spacer()
                Text(" \(habit.streak) days")
                    .font(.subheadline)
                    .foregroundStyle(.orange)
            }
            
            HStack(spacing: 8) {
                ForEach(last7Days, id: \.self) { day in
                    VStack(spacing: 4) {
                        Circle()
                            .fill(habit.completionDates.contains {
                                Calendar.current.isDate($0, inSameDayAs: day)
                            } ? (habit.habitType == .build ? Color.green : Color.red)
                                  : Color.gray.opacity(0.3))
                        
                        Text(dayInitial(day))
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.3))
        .cornerRadius(12)
    }
    
    func dayInitial(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E" //is a format code that means "abbreviated day name
        return String(formatter.string(from: date).prefix(1))
    }
}


#Preview {
    StatsView()
        .modelContainer(for: HabitModel.self, inMemory: true)
}

