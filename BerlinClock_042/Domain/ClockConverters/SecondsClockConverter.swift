
import Foundation

class SecondsClockConverter {
    
    
    func convertSecondsClockToLamps(seconds: Int) -> SecondsLamp {
        
        if (seconds % 2 == 0) {
            return .on
        }
        return .off
    }
}
