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
        let hour = timeRemaining / 3600
         let minute = (timeRemaining % 3600) / 60
         let second = timeRemaining % 60
        return String(format: "%02d:%02d:%02d",hour, minute, second)
    }
    
    
    func pauseTimer() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }
    

    func resetTimer() {
        pauseTimer()
        timeRemaining = selectedHabit?.durationInSeconds ?? 25 * 60
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

