
import Foundation

struct Hour {
    let value: Int
    
    init?(_ value: Int) {
        guard (BerlinClockConstants.TimeRange.hours).contains(value) else { return nil }
        self.value = value
    }
}

