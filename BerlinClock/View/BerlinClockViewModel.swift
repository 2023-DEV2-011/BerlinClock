//
//  BerlinClockViewModel.swift
//  BerlinClock
//
//  Created on 27/01/2024.
//

import Foundation
import SwiftUI
import Observation
import Combine

@Observable
class BerlinClockViewModel {
    
    // MARK: - Properties
    
    var secondsLampsState: LampState
    var hoursFirstRowState: [LampState]
    var hoursSecondRowState: [LampState]
    var minutesFirstRowState: [LampState]
    var minutesSecondRowState: [LampState]
    
    private var manager = BerlinClockManager()
    private var cancellable: AnyCancellable?
    
    // MARK: - Init
    
    init() {
        secondsLampsState = .off
        hoursFirstRowState = Array(repeating: .off, count: Constants.maxHoursLamp)
        hoursSecondRowState = Array(repeating: .off, count: Constants.maxHoursLamp)
        minutesFirstRowState = Array(repeating: .off, count: Constants.maxFirstRowMinutesLamp)
        minutesSecondRowState = Array(repeating: .off, count: Constants.maxSecondRowMinutesLamp)
    }
    
}

// MARK: - Event

extension BerlinClockViewModel {
        
    func startTrackingTime() {
        cancellable = Timer.TimerPublisher(interval: 1, runLoop: .main, mode: .common)
            .autoconnect()
            .sink { [weak self] date in
                self?.updateState(from: date)
            }
    }
    
    private func updateState(from date: Date) {
        secondsLampsState = manager.computeSecondsLampState(from: date)
        
        let hoursLampState = manager.computeHoursLampState(from: date)
        hoursFirstRowState = hoursLampState.first!
        hoursSecondRowState = hoursLampState.last!
        
        let minutesLampState = manager.computeMinutesLampState(from: date)
        minutesFirstRowState = minutesLampState.first!
        minutesSecondRowState = minutesLampState.last!
    }
    
}

// MARK: - Helpers

extension BerlinClockViewModel {
    
    func color(for lampState: LampState) -> Color {
        switch lampState {
        case .off:
            return .white
        case .red:
            return .red
        case .yellow:
            return .yellow
        }
    }
    
}
