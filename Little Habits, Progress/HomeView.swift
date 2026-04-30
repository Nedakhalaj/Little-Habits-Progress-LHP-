//
//  HomeView.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-04-30.
//

import SwiftUI
import SwiftData

struct HomeView: View {
     @Query var query: HabitModel
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ZStack{
            Color("AppBackground")
                .ignoresSafeArea()
            List{
                
            }
            
        }
      
    }
}
