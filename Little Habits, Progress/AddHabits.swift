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
                    print("Button tapped — habit: '\(newHabit)', purpose: '\(purpose)'")
                    guard !newHabit.isEmpty, let purposeDouble = Double(purpose) else {
                        print("Guard failed — empty: \(newHabit.isEmpty), double: \(Double(purpose) as Any)")
                        return
                    }
                    let habit = HabitModel(title: newHabit, purposeAmount: purposeDouble, habitType: selectedHabitType)
                    modelContext.insert(habit)
                    print("Inserted successfully")
                    newHabit = ""
                    purpose = ""
                }
                //.disabled(newNoteText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                    
            }
            .padding()
        }
        
    }
}
#Preview {
    AddHabits()
        .modelContainer(for: HabitModel.self, inMemory: true)
}
