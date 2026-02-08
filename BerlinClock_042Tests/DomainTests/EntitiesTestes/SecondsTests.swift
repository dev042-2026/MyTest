
import Testing

@testable import BerlinClock_042

@Suite("Seconds Clock value validation")
struct SecondsTests {
    
    @Test(arguments: [65, 77, 88, 99])
    func validateSeconds_when_value_moreThanFifityNine(seconds: Int) {
        //Act
        let result = Seconds(seconds)
        //Assert
        #expect(result == nil)
    }
    
    @Test(arguments: [0, 6, 17, 30, 59])
    func validateSeconds_when_value_range_ZeroAndFiftyNine(seconds: Int) {
        //Act
        let result = Seconds(seconds)
        //Assert
        #expect(result != nil)
    }
    
    @Test(arguments: [-1,-59, -70])
    func validateSeconds_when_value_negative(seconds: Int) {
        //Act
        let result = Seconds(seconds)
        //Assert
        #expect(result == nil)
    }
    
}
