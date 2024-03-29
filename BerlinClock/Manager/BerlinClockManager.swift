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
    
    func computeMinutesLampState(from date: Date) -> [[LampState]] {
        let minutes = Calendar.current.component(.minute, from: date)
        let firstRowActiveLamp = minutes / Constants.minuteFirstRowLampValue
        
        var firstRowLampState = Array(repeating: LampState.off, count: Constants.maxFirstRowMinutesLamp)
        for i in 0..<firstRowActiveLamp {
            firstRowLampState[i] = (i + 1) % 3 == 0 ? .red : .yellow
        }
        
        let secondRowActiveLamp = minutes % Constants.minuteFirstRowLampValue
        let secondRowLampState = createLampStateRow(activeLamp: secondRowActiveLamp,
                                                    activeLampState: .yellow,
                                                    count: Constants.maxSecondRowMinutesLamp)

        return [firstRowLampState, secondRowLampState]
    }
    
}

// MARK: - Helper

private extension BerlinClockManager {
    
    func createLampStateRow(activeLamp: Int, activeLampState: LampState = .red, count: Int = Constants.maxHoursLamp) -> [LampState] {
        var lampStates = Array(repeating: LampState.off, count: count)
        for i in 0..<activeLamp {
            lampStates[i] = activeLampState
        }
        
        return lampStates
    }
    
}
