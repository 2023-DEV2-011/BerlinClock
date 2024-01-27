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
    
    // MARK: Hours Test
    
    func testComputeHoursLampStateForFiveHours() throws {
        let fiveHourDate = Calendar.current.date(bySettingHour: 5, minute: 0, second: 0, of: Date())!
        let manager = BerlinClockManager()
        assert(manager.computeHoursLampState(from: fiveHourDate) == [[.red, .off, .off, .off], [.off, .off, .off, .off]])
    }
    
    func testComputeHoursLampStateForTenHours() throws {
        let tenHourDate = Calendar.current.date(bySettingHour: 10, minute: 0, second: 0, of: Date())!
        let manager = BerlinClockManager()
        assert(manager.computeHoursLampState(from: tenHourDate) == [[.red, .red, .off, .off], [.off, .off, .off, .off]])
    }
    
    func testComputeHoursLampStateForEightHours() throws {
        let eightHourDate = Calendar.current.date(bySettingHour: 8, minute: 0, second: 0, of: Date())!
        let manager = BerlinClockManager()
        assert(manager.computeHoursLampState(from: eightHourDate) == [[.red, .off, .off, .off], [.red, .red, .red, .off]])
    }
    
    // MARK: - Minutes Test
    
    func testComputeMinutesLampStateForFiveMinutes() throws {
        let fiveMinutesDate = Calendar.current.date(bySettingHour: 0, minute: 5, second: 0, of: Date())!
        let manager = BerlinClockManager()
        assert(manager.computeMinutesLampState(from: fiveMinutesDate) == [[.yellow, .off, .off, .off, .off, .off, .off, .off, .off, .off, .off],
                                                     [.off, .off, .off, .off]])
    }

}
