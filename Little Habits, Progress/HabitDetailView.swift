//
//  HabitDetailView.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-05-02.
//

import SwiftUI
import SwiftData

struct HabitDetailView: View {
    //@ObservedObject var viewModel: HabitDetailViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Habit")) {
                    HStack {
                        //Text(viewModel.habit.name)
                        Spacer()
                    }
                }
            }
        }
    }
}
