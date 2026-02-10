
import Foundation

class BerlinClockViewModel {
    
    private let secondsConverter = SecondsClockConverter()
    private let fiveHoursConverter = FiveHourClockConverter()
    private let oneHourClockConverter = OneHourClockConverter()
    private let fiveMinuteConverter = FiveMinuteClockConverter()
    
    func secondsLampState(secondFieldData: Int) -> SecondsLamp {
        guard let seconds = Seconds(secondFieldData) else { return .off }
        return secondsConverter.convertSecondsClockToLamps(seconds: seconds)
    }
    
    func fiveHourLampState(hourFieldData: Int) -> [FiveHourLamp] {
        guard let hours = Hour(hourFieldData) else { return [] }
        return fiveHoursConverter.convertToFiveHourLamp(hours: hours)
    }
    
    func oneHourLampState(hourFieldData: Int) -> [OneHourLamp] {
        guard let hours = Hour(hourFieldData) else { return [] }
        return oneHourClockConverter.convertToOneHourLamp(hour: hours)
    }
    
    func fiveMinuteLampState(minuteFieldData: Int) -> [FiveMinuteLamp] {
        guard let minutes = Minutes(minuteFieldData) else { return [] }
        return fiveMinuteConverter.convertToFiveMinuteLamp(minutes: minutes)
    }
}
