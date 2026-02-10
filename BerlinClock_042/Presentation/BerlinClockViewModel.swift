
import Foundation

class BerlinClockViewModel {
    
    private let secondsConverter = SecondsClockConverter()
    private let fiveHoursConverter = FiveHourClockConverter()
    
    func secondsLampState(secondFieldData: Int) -> SecondsLamp {
        guard let seconds = Seconds(secondFieldData) else { return .off }
        return secondsConverter.convertSecondsClockToLamps(seconds: seconds)
    }
    
    func fiveHourLampState(hourFieldData: Int) -> [FiveHourLamp] {
        guard let hours = Hour(hourFieldData) else { return [] }
        return fiveHoursConverter.convertToFiveHourLamp(hours: hours)
    }
}
