//
//  UseModel.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-05-06.
//

import Foundation
import  SwiftData

@Model
class UserModel{
    var username: String
    var password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}
