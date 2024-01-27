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
        let firstRowActiveLamp = hours / Constants.hoursFirstRowLampValue
        let secondRowActiveLamp = hours % Constants.hoursFirstRowLampValue
        
        let firstRowLampState = createLampStateRow(activeLamp: firstRowActiveLamp)
        let secondRowLampState = createLampStateRow(activeLamp: secondRowActiveLamp)
        
        return [firstRowLampState, secondRowLampState]
    }
    
}

// MARK: - Helper

private extension BerlinClockManager {
    
    func createLampStateRow(activeLamp: Int, count: Int = Constants.maxHoursLamp) -> [LampState] {
        var lampStates = Array(repeating: LampState.off, count: count)
        for i in 0..<activeLamp {
            lampStates[i] = .red
        }
        
        return lampStates
    }
    
}
