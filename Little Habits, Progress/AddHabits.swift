//
//  AddHabits].swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-04-30.
//
import SwiftUI
import SwiftData

struct AddHabits: View {
    
@State private var newHabit: String = ""
@State private var purpose: String = ""
@State private var selectedHabitType: HabitType = .build
    
@Environment(\.modelContext) var modelContext
    
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            VStack {
                TextField("Add a new habit", text: $newHabit)
                    .font(.title)
                    .background()
                TextField("Purpose", text: $purpose)
                    .font(.title)
                    .background()
                Picker("Habit type", selection: $selectedHabitType) {
                    Text("Build").tag(HabitType.build)
                    Text("Reduce").tag(HabitType.reduce)
                }
                .pickerStyle(.segmented)
               
                Button("Add") {
                    guard !newHabit.isEmpty, let purposeDouble = Double(purpose) else { return }
                    let habit = HabitModel(title: newHabit, purposeAmount: purposeDouble, habitType: selectedHabitType)
                    modelContext.insert(habit)
                    newHabit = ""
                    purpose = ""
                }
                    
            }
            .padding()
        }
        
    }
}
#Preview {
    AddHabits()
}
