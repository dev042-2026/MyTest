
import SwiftUI

struct BerlinLiveClockView: View {
    
    @ObservedObject var berlinClockViewModel: BerlinClockViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            
            // Seconds lamp
            Circle()
                .fill(berlinClockViewModel.secondsLamp.color)
                .frame(width: 30, height: 30)
            
            // Five hour row
            HStack {
                ForEach(0..<berlinClockViewModel.fiveHourLamps.count, id: \.self) { index in
                    Circle()
                        .fill(berlinClockViewModel.fiveHourLamps[index].color)
                        .frame(width: 30, height: 30)
                }
            }
            
            // One hour row
            HStack {
                ForEach(0..<berlinClockViewModel.oneHourLamps.count, id: \.self) { index in
                    Circle()
                        .fill(berlinClockViewModel.oneHourLamps[index].color)
                        .frame(width: 30, height: 30)
                }
            }
            
            // Five minute row
            HStack(spacing: 4) {
                ForEach(0..<berlinClockViewModel.fiveMinuteLamps.count, id: \.self) { index in
                    Circle()
                        .fill(berlinClockViewModel.fiveMinuteLamps[index].color)
                        .frame(width: 30, height: 30)
                }
            }
            
            // One minute row
            HStack {
                ForEach(0..<berlinClockViewModel.oneMinuteLamps.count, id: \.self) { index in
                    Circle()
                        .fill(berlinClockViewModel.oneMinuteLamps[index].color)
                        .frame(width: 30, height: 30)
                }
            }
            
            // Start/Stop Button
            Button(berlinClockViewModel.isLiveMode ? "Stop Live Berlin Clock" : "Start Live Berlin Clock") {
                if berlinClockViewModel.isLiveMode {
                    berlinClockViewModel.stopLiveMode()
                } else {
                    berlinClockViewModel.startLiveMode()
                }
            }
            .frame(width: 250, height: 60)
            .buttonStyle(.borderedProminent)
            .tint(berlinClockViewModel.isLiveMode ? .red : .blue)
        }
    }
}

