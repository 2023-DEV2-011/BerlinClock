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
            clockRowView(for: viewModel.hoursFirstRowState)
            clockRowView(for: viewModel.hoursSecondRowState)
        }
        .padding(16)
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
    
    func clockRowView(for states: [LampState]) -> some View {
        HStack {
            ForEach(0..<states.count, id: \.self) { index in
                Rectangle()
                    .stroke(.black)
                    .fill(viewModel.color(for: states[index]))
                    .frame(height: 50)
            }
        }
    }
    
}

#Preview {
    BerlinClockView()
}
