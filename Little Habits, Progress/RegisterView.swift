//
//  RegisterView.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-05-06.
//

import SwiftUI
import SwiftData

struct RegisterView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showError: String = ""
    
    var body: some View {
        ZStack {
            Color("AppBackground")
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Create Account")
                    .font(.largeTitle)
                    .bold()
                
                TextField("Username", text: $username)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(.roundedBorder)
                
                if !showError.isEmpty {
                    Text(showError)
                        .foregroundStyle(.red)
                        .font(.caption)
                }
                
                Button("Register") {
                    guard !username.isEmpty, !password.isEmpty else {
                        showError = "Please fill in all fields"
                        return
                    }
                    guard password == confirmPassword else {
                        showError = "Passwords don't match"
                        return
                    }
                    let user = UserModel(username: username, password: password)
                    modelContext.insert(user)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                
                Button("Cancel") { dismiss() }
                    .font(.caption)
            }
            .padding()
        }
    }
}

