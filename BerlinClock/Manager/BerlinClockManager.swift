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
        return [[.red, .off, .off, .off], [.off, .off, .off, .off]]
    }
    
}
