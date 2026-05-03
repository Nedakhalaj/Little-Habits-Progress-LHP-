//
//  ProgressView.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-04-30.
//
import SwiftUI
import SwiftData

struct ProgressView: View {
    @Query var query: [HabitModel]
    
    
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
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
        }
        
    }
}

struct HabitProgressCard: View {
    var habit: HabitModel

    var last7Days: [Date] {
        (0..<7)
            .compactMap { Calendar.current.date(byAdding: .day, value: -$0, to: Date.now) }
            .reversed()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(habit.title)
                    .font(.headline)
                Spacer()
                Text("🔥 \(habit.streak) days")
                    .font(.subheadline)
                    .foregroundStyle(.orange)
            }

            HStack(spacing: 8) {
                ForEach(last7Days, id: \.self) { day in
                    VStack(spacing: 4) {
                        Circle()
                            .fill(habit.completionDates.contains {
                                Calendar.current.isDate($0, inSameDayAs: day)
                            } ? Color.green : Color.gray.opacity(0.3))
                            .frame(width: 32, height: 32)
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
        formatter.dateFormat = "E"
        return String(formatter.string(from: date).prefix(1))
    }
}
#Preview{
    ProgressView()
}

