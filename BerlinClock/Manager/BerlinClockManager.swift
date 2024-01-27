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
    
    func computeSecondsLampState() -> LampState {
        return .red
    }
    
}
