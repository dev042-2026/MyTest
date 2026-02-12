
import SwiftUI

struct BerlinLiveClockView: View {
    
    @ObservedObject var berlinClockViewModel: BerlinClockViewModel
    var onStart: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            
            // Seconds lamp
            Circle()
                .fill(berlinClockViewModel.secondsLamp.color)
                .frame(width: 30, height: 30)
            
            // Five hour row
            HStack {
                ForEach(0..<berlinClockViewModel.fiveHourLamps.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 4)
                        .fill(berlinClockViewModel.fiveHourLamps[index].color)
                        .frame(width: 70, height: 40)
                }
            }
            
            // One hour row
            HStack {
                ForEach(0..<berlinClockViewModel.oneHourLamps.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 4)
                        .fill(berlinClockViewModel.oneHourLamps[index].color)
                        .frame(width: 70, height: 40)
                }
            }
            
            // Five minute row
            HStack(spacing: 4) {
                ForEach(0..<berlinClockViewModel.fiveMinuteLamps.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 4)
                        .fill(berlinClockViewModel.fiveMinuteLamps[index].color)
                        .frame(width: 25, height: 50)
                }
            }
            
            // One minute row
            HStack {
                ForEach(0..<berlinClockViewModel.oneMinuteLamps.count, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 4)
                        .fill(berlinClockViewModel.oneMinuteLamps[index].color)
                        .frame(width: 70, height: 40)
                }
            }
            
            // Start/Stop Button
            Button(berlinClockViewModel.isLiveMode ? "Stop Live Berlin Clock" : "Start Live Berlin Clock") {
                if berlinClockViewModel.isLiveMode {
                    berlinClockViewModel.stopLiveMode()
                } else {
                    berlinClockViewModel.startLiveMode()
                    onStart?() 
                }
            }
            .frame(width: 250, height: 60)
            .buttonStyle(.borderedProminent)
            .tint(berlinClockViewModel.isLiveMode ? .red : .blue)
        }
    }
}

