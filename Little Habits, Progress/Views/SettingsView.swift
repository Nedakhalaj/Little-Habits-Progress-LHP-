//
//  SettingsView.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-04-30.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false

    var body: some View {

        ZStack{
            Color("AppBackground")
                .ignoresSafeArea()
            VStack{


                Text("Settings")
                    .font(.title)
                    .bold()
                Spacer()
                Button("Logout"){
                    isLoggedIn = false
                }
                .buttonStyle(.borderedProminent)
                .tint(.red)
                .padding()
            }
        }
    }
}
