//
//  timerr.swift
//  Ames
//
//  Created by Ashel D Souza on 13/05/23.
//

import Foundation
enum Timermode{
    case running
    case paused
    case initial
    
}
func secondsToMinutesAndSeconds(seconds: Int) -> String {
    let minutes = "\((seconds % 3600) / 60)"
    let seconds = "\((seconds % 3600) % 60)"
    let minuteStamp = minutes.count > 1 ? minutes : "0"  + minutes
    let secondStamp = seconds.count > 1 ? seconds : "0"  + seconds
    return "\(minuteStamp) : \(secondStamp)"

    
    
    
}
