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
        let manager = BerlinClockManager()
        assert(manager.computeSecondsLampState() == .red)
    }

}
