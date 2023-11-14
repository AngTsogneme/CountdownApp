//
//  CountdownTimerView.swift
//  CountDown
//
//  Created by Ang T on 2023-11-14.
//

import SwiftUI

struct CountdownTimerView: View {
    var targetDate: Date

    var body: some View {
        Text("Time Remaining: \(formattedTime)")
            .font(.title2)
            .bold()
            .padding()
            .onAppear {
                startTimer()
            }
    }

    private var formattedTime: String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.day, .hour, .minute, .second]

        return formatter.string(from: max(0, targetDate.timeIntervalSinceNow)) ?? ""
    }

    private func startTimer() {
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            // Update the view when the timer fires
            // This is a simple version; you might want to use Combine for a more reactive approach
        }
    }
}

struct CountdownTimerView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownTimerView(targetDate: Date())
    }
}
