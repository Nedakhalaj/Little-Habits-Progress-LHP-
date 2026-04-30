//
//  ContentView.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-04-28.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            
            Color("AppBackground")
                .ignoresSafeArea()
            TabView{
                ProgressView()
                    .tabItem{
                        Label("Progress", systemImage: "chart.bar.fill")
                    }
                SettingView()
                    .tabItem{
                        Label("Settings", systemImage: "gear")
                    }
                AddHabits()
                    .tabItem{
                        Label("Add", systemImage: "plus")
                    }
                FocusTime()
                    .tabItem{
                        Label("Focus", systemImage: "timer")
                    }
            }
            .toolbarBackground(Color("AppBackground"), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
    }
}







#Preview {
    ContentView()
}
