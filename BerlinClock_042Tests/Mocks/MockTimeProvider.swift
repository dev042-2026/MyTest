
import Foundation
@testable import BerlinClock_042

class MockTimeProvider: TimeProviderProtocol {
    
    var mockTime = Time(hour: 0, minute: 0, second: 0)
    
    func getSystemTime() -> Time {
        return mockTime
    }

}
