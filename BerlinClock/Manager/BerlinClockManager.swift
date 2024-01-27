//
//  BerlinClockManager.swift
//  BerlinClock
//
//  Created on 27/01/2024.
//

import Foundation

enum LampState {
    
    case off
    case red
    case yellow
    
}

class BerlinClockManager {
    
    func computeSecondsLampState(from date: Date) -> LampState {
        let seconds = Calendar.current.component(.second, from: date)
        return seconds % 2 == 0 ? .red : .off
    }
    
    func computeHoursLampState(from date: Date) -> [[LampState]] {
        let hours = Calendar.current.component(.hour, from: date)
        let activeLamp = hours / Constants.hoursFirstRowLampValue
        var firstRowLampState = Array(repeating: LampState.off, count: Constants.maxHoursLamp)
        
        for i in 0..<activeLamp {
            firstRowLampState[i] = .red
        }
        
        return [firstRowLampState, [.off, .off, .off, .off]]
    }
    
}
