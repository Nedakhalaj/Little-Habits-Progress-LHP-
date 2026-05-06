//
//  Setting.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-04-30.
//


import SwiftUI

struct SettingView: View {
    @AppStorage("isLoggedIn") var isLoggIn: Bool = false
    
    var body: some View {
        
        ZStack{
            Color("AppBackground")
                .ignoresSafeArea()
            VStack{
                
                
                Text("settings")
                    .font(.title)
                    .bold()
                Spacer()
                Button("Logout"){
                    isLoggIn = false
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .padding()
            }
        }
    }
}
