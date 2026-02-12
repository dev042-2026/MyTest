
import Foundation

class BerlinClockViewModel: ObservableObject {
    
    private let secondsConverter = SecondsClockConverter()
    private let fiveHoursConverter = FiveHourClockConverter()
    private let oneHourClockConverter = OneHourClockConverter()
    private let fiveMinuteConverter = FiveMinuteClockConverter()
    private let oneMinuteConverter = OneMinuteClockConverter()
    
    //state publishers
    @Published var secondsLamp: SecondsLamp = .off
    @Published var fiveHourLamps: [FiveHourLamp] = []
    @Published var oneHourLamps: [OneHourLamp] = []
    @Published var fiveMinuteLamps: [FiveMinuteLamp] = []
    @Published var oneMinuteLamps: [OneMinuteLamp] = []
    
    private let timeProvider: TimeProviderProtocol
    @Published var isLiveMode: Bool = true
    private var timer: Timer?
    
    @Published var errorMessage: String? = nil
    
    init(timeProvider: TimeProviderProtocol = TimeProvider()) {
        self.timeProvider = timeProvider
        startLiveMode()
    }
    
    func stopLiveMode() {
        isLiveMode = false
        timer?.invalidate()
        timer = nil
    }
    
    func startLiveMode() {
        isLiveMode = true
        updateFromSystemTime()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateFromSystemTime()
        }
    }
    
    func convert(hoursText: String, minutesText: String, secondsText: String) {
        guard let hours = Int(hoursText),
              let minutes = Int(minutesText),
              let seconds = Int(secondsText) else {
            errorMessage = BerlinClockConstants.TimeRange.ErrorMessage.nonNumericInput
            return
        }
        convert(hours: hours, minutes: minutes, seconds: seconds)
    }
    
    func convert(hours: Int, minutes: Int, seconds: Int) {
        guard validateTime(hours: hours, minutes: minutes, seconds: seconds) else {
                return
            }
        stopLiveMode()
        convertInternal(hours: hours, minutes: minutes, seconds: seconds)
    }
    
    private func convertInternal(hours: Int, minutes: Int, seconds: Int) {
        secondsLamp = secondsLampState(secondFieldData: seconds)
        fiveHourLamps = fiveHourLampState(hourFieldData: hours)
        oneHourLamps = oneHourLampState(hourFieldData: hours)
        fiveMinuteLamps = fiveMinuteLampState(minuteFieldData: minutes)
        oneMinuteLamps = oneMinuteLampState(minuteFieldData: minutes)
    }
    
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
    
    func oneMinuteLampState(minuteFieldData: Int) -> [OneMinuteLamp] {
        guard let minutes = Minutes(minuteFieldData) else { return [] }
        return oneMinuteConverter.convertToOneMinuteLamp(minutes: minutes)
    }
    
    func updateFromSystemTime() {
        let time = timeProvider.getSystemTime()
        convertInternal(hours: time.hour, minutes: time.minute, seconds: time.second)
    }
    
    private func validateTime(hours: Int, minutes: Int, seconds: Int) -> Bool {
        guard Hour(hours) != nil else {
            errorMessage = BerlinClockConstants.TimeRange.ErrorMessage.invalidHour
            return false
        }
        guard Minutes(minutes) != nil else {
            errorMessage = BerlinClockConstants.TimeRange.ErrorMessage.invalidMinute
            return false
        }
        guard Seconds(seconds) != nil else {
            errorMessage = BerlinClockConstants.TimeRange.ErrorMessage.invalidSecond
            return false
        }
        
        errorMessage = nil
        return true
    }
}
