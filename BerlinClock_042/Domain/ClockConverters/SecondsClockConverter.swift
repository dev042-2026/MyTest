
import Foundation

class SecondsClockConverter {
    
    
    func convertSecondsClockToLamps(seconds: Seconds) -> SecondsLamp {
        
        if (seconds.value % 2 == 0) {
            return .on
        }
        return .off
    }
}
