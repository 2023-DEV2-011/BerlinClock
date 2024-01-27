//
//  BerlinClockView.swift
//  BerlinClock
//
//  Created on 27/01/2024.
//

import SwiftUI

struct BerlinClockView: View {
    
    // MARK: - Properties
    
    @State var viewModel = BerlinClockViewModel()
    
    // MARK: - View
    
    var body: some View {
        VStack {
            secondsView(for: viewModel.secondsLampsState)
        }
        .onAppear {
            viewModel.startTrackingTime()
        }
    }
    
    private func secondsView(for state: LampState) -> some View {
        Circle()
            .stroke(.black)
            .fill(viewModel.color(for: state))
            .frame(width: 60)
    }
    
}

#Preview {
    BerlinClockView()
}
