//
//  FocusTimerViewModel.swift
//  Little Habits, Progress
//
//  Created by neda khalajnejad on 2026-05-04.
//

import Observation
import SwiftUI


@Observable
class FocusTimeViewModel{
    var selectedHabit: HabitModel? = nil
     var timeRemaining: Int = 25 * 60
     var isRunning: Bool = false
     var timer: Timer? = nil
    
    var timeDisplay: String{
         let minute = timeRemaining / 60
         let second = timeRemaining % 60
        return String(format: "%02d:%02d", minute, second)
    }
    
    
    func pauseTimer() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }
    

    func resetTimer() {
        pauseTimer()
        timeRemaining = selectedHabit != nil ? Int(selectedHabit!.purposeAmount) * 60 : 25 * 60
    }
    

    func completeTimer() {
        pauseTimer()
        selectedHabit?.completionDates.append(Date.now)
    }
    
    
    func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            } else {
                self.completeTimer()
            }
        }
    }

}

