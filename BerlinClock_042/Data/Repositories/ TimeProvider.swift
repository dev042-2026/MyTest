import Foundation

class TimeProvider {
    
    func getSystemTime() -> Time {
        let now = Date()
        let calendar  = Calendar.current
        return Time(
            hour: calendar.component(.hour, from: now),
            minute: calendar.component(.minute, from: now),
            second: calendar.component(.second, from: now)
        )
    }
}

