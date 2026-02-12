
import Foundation

class OneMinuteClockConverter {
    
    func convertToOneMinuteLamp(minutes: Minutes) -> [OneMinuteLamp] {
        let lampsOn = minutes.value % 5
        return (0..<BerlinClockConstants.LampCount.oneMinute).map {
             $0 < lampsOn ? .yellowColor : .noColor
        }
    }
}

