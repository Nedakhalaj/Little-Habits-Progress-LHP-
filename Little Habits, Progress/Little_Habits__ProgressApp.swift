//
//  Little_Habits__ProgressApp.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-04-28.
//

import SwiftUI
import SwiftData

@main
struct Little_Habits__ProgressApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: HabitModel.self )
        }
    }
}
