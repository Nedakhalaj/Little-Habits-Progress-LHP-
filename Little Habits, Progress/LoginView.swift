//
//  LoginView.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-05-06.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @Query var users: [UserModel]
    @Environment(\.modelContext) var modelContext
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showError: Bool = false
    @State private var showRegister: Bool = false
    var body: some View {
        ZStack{
            Color("AppBackground")
                .ignoresSafeArea()
            VStack{
                Text("LHP")
                    .font(.largeTitle)
                    .bold()
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                if showError {
                    Text("Invalid username or password")
                        .foregroundColor(.red)
                        .font(.caption)
                }
                Button("Login"){
                    let match =  users.first{
                        $0.username == username && $0.password == password
                    }
                    if match != nil {
                        isLoggedIn = true
                    }else{
                        showError = true
                    }
                }
                .buttonStyle(.borderedProminent)
                
                Button("Dont have an account? Register"){
                    showRegister = true
                }
                .font(.caption)
                
            }
            .padding()
        }
        .sheet(isPresented: $showRegister){
            RegisterView()
        }
    }
}
