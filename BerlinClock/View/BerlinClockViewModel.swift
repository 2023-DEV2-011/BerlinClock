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
    
    private var manager = BerlinClockManager()
    private var cancellable: AnyCancellable?
    
    // MARK: - Init
    
    init() {
        secondsLampsState = .off
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
