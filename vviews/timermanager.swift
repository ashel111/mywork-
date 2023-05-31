//
//  timermanager.swift
//  Ames
//
//  Created by Ashel D Souza on 18/05/23.
//

import Foundation
import SwiftUI

class timermanager: ObservableObject {
   @Published var timerMode: Timermode = .initial
    
    @Published var secondsleft = UserDefaults.standard.integer(forKey: "timerLength")
    var timer = Timer()
    func setTimerLength(minutes: Int) {
        let defaults  = UserDefaults.standard
        defaults.set(minutes, forKey: "timerLength")
        secondsleft = minutes
    }
    
    func start() {
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in if self.secondsleft == 0 {
            self.reset()
            
        }
            self.secondsleft -= 1
        })
    }
    func reset() {
        self.timerMode = .initial
        self.secondsleft = UserDefaults.standard.integer(forKey: "timerLength")
        timer.invalidate()
    }
    func pause() {
        self.timerMode = .paused
        timer.invalidate()
    }
}
