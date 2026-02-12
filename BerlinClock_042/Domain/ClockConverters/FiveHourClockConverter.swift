
import Foundation

class FiveHourClockConverter {
    
    func convertToFiveHourLamp(hours: Hour) -> [FiveHourLamp] {
        let lampsOn = hours.value / 5
        return (0..<BerlinClockConstants.LampCount.fiveHour).map {
            $0 < lampsOn ? .redColor : .noColor
        }
    }
}
