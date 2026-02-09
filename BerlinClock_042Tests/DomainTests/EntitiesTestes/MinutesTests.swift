
import Testing

@testable import BerlinClock_042

@Suite("Minutes Clock value validation")
struct MinutesTests {
    
    @Test(arguments: [6, 7, 52, 53])
    func validateMinutes_when_value_range_ZeroAndFiftyNine(minutes: Int) {
        //Act
        let result = Minutes(minutes)
        //Assert
        #expect(result != nil)
    }
    
    @Test(arguments: [65, 77, 88, 99])
    func validateMinutes_when_value_moreThanFifityNine(minutes: Int) {
        //Act
        let result = Minutes(minutes)
        //Assert
        #expect(result == nil)
    }
}
