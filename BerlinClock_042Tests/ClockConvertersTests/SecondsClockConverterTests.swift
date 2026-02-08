
import Testing
@testable import BerlinClock_042

@Suite("Seconds clock convertion validation")
struct SecondsClockConverterTests {
    
    @Test(arguments: [0,2,12,24])
    func secondsClockConverter_when_value_even(seconds: Int) {
        //Arrange
        let sut = SecondsClockConverter()
        //Act
        let result = sut.convertSecondsClockToLamps(seconds: seconds)
        //Assert
        #expect(result == SecondsLamp.on)
    }
}
