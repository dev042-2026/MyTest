
import Foundation

class FiveHourClockConverter {
    
    func convertToFiveHourLamp(hours: FiveHour) -> [FiveHourLamp] {
        let lampsOn = hours.value / 5
        return (0..<4).map {
            $0 < lampsOn ? .redColor : .noColor
        }
    }
}
