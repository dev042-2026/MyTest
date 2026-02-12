
import Foundation

struct Minutes {
    let value: Int
    
    init?(_ value: Int) {
        guard (BerlinClockConstants.TimeRange.minutes).contains(value) else { return nil }
        self.value = value
    }
}

