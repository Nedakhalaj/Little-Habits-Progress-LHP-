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
@State private var selectedHabitUnit: HabitUnit = .hours
@State private var startDate: Date = Date.now
    
@Environment(\.modelContext) var modelContext
    
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            VStack {
                TextField("Add a new habit", text: $newHabit)
                    .textFieldStyle(.roundedBorder)
                    
                TextField("Purpose", text: $purpose)
                    .textFieldStyle(.roundedBorder)
                   
                Picker("purpose type", selection: $selectedHabitUnit) {
                    Text("Hours").tag(HabitUnit.hours)
                    Text("Minutes").tag(HabitUnit.minutes)
                    Text("Times").tag(HabitUnit.times)
                }
                .pickerStyle(.segmented)
                
                Text("\(startDate.formatted(date: .abbreviated, time: .omitted))")
                Picker("Habit type", selection: $selectedHabitType) {
                    Text("Build").tag(HabitType.build)
                    Text("Reduce").tag(HabitType.reduce)
                }
                .pickerStyle(.segmented)
                
              
               
                Button("Add") {
                    guard !newHabit.isEmpty, let purposeDouble = Double(purpose) else {
                        return
                    }
                    let habit = HabitModel(title: newHabit, purposeAmount: purposeDouble, habitType: selectedHabitType,habitUnit: selectedHabitUnit ,startDate: startDate)
                    modelContext.insert(habit)
                    newHabit = ""
                    purpose = ""
                }
                .buttonStyle(.borderedProminent)
                //.disabled(newNoteText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                  Spacer()
                
                DatePicker("Start Date", selection: $startDate,  displayedComponents: .date)
                    .datePickerStyle(.graphical)
            }
            .padding()
        }
        
    }
}
#Preview {
    AddHabits()
        .modelContainer(for: HabitModel.self, inMemory: true)
}
