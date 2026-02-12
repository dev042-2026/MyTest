
import Foundation

class OneHourClockConverter {
    
    func convertToOneHourLamp(hour: Hour) -> [OneHourLamp] {
        
        let lampsOn = hour.value % 5
        return (0..<BerlinClockConstants.LampCount.oneHour).map {
             $0 < lampsOn ? .redColor : .noColor
        }
    }
}
