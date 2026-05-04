//
//  FocusTime.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-04-30.
//

import SwiftUI
import SwiftData

struct FocusTime:View {
    @Query var query: [HabitModel]
    @Environment(\.modelContext) var context
    @State private var selectedHabit: HabitModel? = nil
    @State private var timeRemaining: Int = 25 * 60
    @State private var isRunning: Bool = false
    @State private var timer: Timer? = nil
    
    var timeDisplay: String{
         let minute = timeRemaining / 60
         let second = timeRemaining % 60
        return String(format: "%02d:%02d", minute, second)
    }
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            VStack {
                Text("Focus Time")
                    .font(.largeTitle)
                    .bold()
                
                Picker("Activity", selection: $selectedHabit){
                    Text("Select an activity").tag(nil as HabitModel?)
                    ForEach(query){item in
                        Text(item.title).tag(Optional(item))
                        
                    }
                    
                }
                .pickerStyle(.menu)
                .onChange(of: selectedHabit) { _, newValue in
                    timer?.invalidate()
                    isRunning = false
                    timeRemaining = newValue != nil ? Int(newValue!.purposeAmount) * 60 : 25 * 60
                }
            }
        }
           
    }
}
#Preview {
    FocusTime()
        .modelContainer(for: HabitModel.self , inMemory: true)
    
}
