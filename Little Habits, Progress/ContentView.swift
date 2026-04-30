//
//  ContentView.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-04-28.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        ZStack {
            
            Color("AppBackground")
                .ignoresSafeArea()
            TabView{
                
                HomeView()
                    .tabItem{
                        Label("Home", systemImage: "house.fill")
                    }
                ProgressView()
                    .tabItem{
                        Label("Progress", systemImage: "chart.bar.fill")
                    }
                AddHabits()
                    .tabItem{
                        Label("Add", systemImage: "plus")
                    }
                
                FocusTime()
                    .tabItem{
                        Label("Focus", systemImage: "timer")
                    }
                
                SettingView()
                    .tabItem{
                        Label("Settings", systemImage: "gear")
                    }
                
            }
            .toolbarBackground(Color("AppBackground"), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
    }
}







#Preview {
    ContentView()
        .modelContainer(for: HabitModel.self, inMemory: true )
}
