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
    @State private var vm = FocusTimeViewModel()
    
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            VStack {
                Text("Focus Time")
                    .font(.largeTitle)
                    .bold()
                
                Picker("Activity", selection: $vm.selectedHabit){
                    Text("Select an activity").tag(nil as HabitModel?)
                    ForEach(query){item in
                        Text(item.title).tag(Optional(item))
                        
                    }
                    
                }
                .pickerStyle(.menu)
                .onChange(of: vm.selectedHabit) { _, newValue in
                    vm.timer?.invalidate()
                    vm.isRunning = false
                    vm.timeRemaining = newValue?.durationInSeconds ?? 25 * 60
                }
                Text(vm.timeDisplay)
                           .font(.system(size: 50, weight: .thin, design: .monospaced))

                       HStack(spacing: 24) {
                           Button("Reset") { vm.resetTimer() }
                               .buttonStyle(.bordered)

                           Button(vm.isRunning ? "Pause" : "Start") {
                               vm.isRunning ? vm.pauseTimer() : vm.startTimer()
                           }
                           .buttonStyle(.borderedProminent)
                       }
                   }
                   .padding()
               }
            }
        }
           
   
#Preview {
    FocusTime()
        .modelContainer(for: HabitModel.self , inMemory: true)
    
}
