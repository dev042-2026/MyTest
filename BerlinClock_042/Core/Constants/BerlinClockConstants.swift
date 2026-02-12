
import Foundation

enum BerlinClockConstants {
    
    enum LampCount {
        static let seconds = 1
        static let fiveHour = 4
        static let oneHour = 4
        static let fiveMinute = 11
        static let oneMinute = 4
    }
    
    enum TimeRange {
        static let hours = 0...23
        static let minutes = 0...59
        static let seconds = 0...59
    }

    static let timerInterval: TimeInterval = 1.0
    static let redLampPositions = [2, 5, 8]
    
}
