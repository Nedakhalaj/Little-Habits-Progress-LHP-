//
//  ContentView.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-04-28.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some View {
        if isLoggedIn {
            TabView{
                
                HomeView()
                    .tabItem{
                        Label("Home", systemImage: "house.fill")
                    }
                StatsView()
                    .tabItem{
                        Label("Progress", systemImage: "chart.bar.fill")
                    }
                AddHabitsView()
                    .tabItem{
                        Label("Add", systemImage: "plus")
                    }

                FocusTimeView()
                    .tabItem{
                        Label("Focus", systemImage: "timer")
                    }

                SettingsView()
                    .tabItem{
                        Label("Settings", systemImage: "gear")
                    }
                
            }
            .toolbarBackground(Color("AppBackground"), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }else{
            LoginView()
        }
    }
}







#Preview {
    ContentView()
        .modelContainer(for: [HabitModel.self, UserModel.self], inMemory: true)
}
