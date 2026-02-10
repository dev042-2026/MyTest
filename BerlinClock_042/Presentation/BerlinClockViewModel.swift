
import Foundation

class BerlinClockViewModel {
    
    private let secondsConverter = SecondsClockConverter()
    
    func secondsLampState(secondFieldData: Int) -> SecondsLamp {
        guard let seconds = Seconds(secondFieldData) else { return .off }
        return secondsConverter.convertSecondsClockToLamps(seconds: seconds)
    }
}
