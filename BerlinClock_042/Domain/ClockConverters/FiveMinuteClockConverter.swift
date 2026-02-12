
import Foundation

class FiveMinuteClockConverter {
    
    func convertToFiveMinuteLamp(minutes: Minutes) -> [FiveMinuteLamp] {
        let lampsOn = minutes.value / 5
        return (0..<BerlinClockConstants.LampCount.fiveMinute).map { index in
            if index < lampsOn {
                BerlinClockConstants.redLampPositions.contains(index) ? .redColor : .yellowColor
            } else {
                .noColor
            }
        }
    }
}
