//
//  BerlinClockManagerTests.swift
//  BerlinClockManagerTests
//
//  Created on 27/01/2024.
//

import XCTest
@testable import BerlinClock

final class BerlinClockManagerTests: XCTestCase {
    
    // MARK: - Second Test

    func testComputeSecondsLampStateForEvenSeconds() throws {
        let evenSecondDate = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())!
        let manager = BerlinClockManager()
        assert(manager.computeSecondsLampState(from: evenSecondDate) == .red)
    }
    
    func testComputeSecondsLampStateForOddSeconds() throws {
        let oddSecondDate = Calendar.current.date(bySettingHour: 0, minute: 0, second: 1, of: Date())!
        let manager = BerlinClockManager()
        assert(manager.computeSecondsLampState(from: oddSecondDate) == .off)
    }

}