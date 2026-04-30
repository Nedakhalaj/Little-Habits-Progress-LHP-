//
//  AddHabits].swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-04-30.
//
import SwiftUI

struct AddHabits: View {
    
@State private var newHabit: String = ""
@State private var amount: String = ""
@State private var purpose: String = ""
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            VStack {
                TextField("Add a new habit", text: $newHabit)
                    .font(.title)
                    .background()
                TextField("Amount", text: $amount)
                    .font(.title)
                    .background()
                TextField("purpose", text: $purpose)
                    .font(.title)
                    .background()
                Button("Add") {
                    
                }
                    
            }
            .padding()
        }
        
    }
}
#Preview {
    AddHabits()
}
