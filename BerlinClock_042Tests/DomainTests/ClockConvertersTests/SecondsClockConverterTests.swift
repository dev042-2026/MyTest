
import Testing
@testable import BerlinClock_042

@Suite("Seconds clock convertion validation")
struct SecondsClockConverterTests {
    
    @Test(arguments: [Seconds(0)!,Seconds(2)!])
    func secondsClockConverter_when_value_even(seconds: Seconds) {
        //Arrange
        let sut = SecondsClockConverter()
        //Act
        let result = sut.convertSecondsClockToLamps(seconds: seconds)
        //Assert
        #expect(result == SecondsLamp.on)
    }
    
    @Test(arguments: [Seconds(1)!,Seconds(45)!])
    func secondsClockConverter_when_value_odd(seconds: Seconds) {
        //Arrange
        let sut = SecondsClockConverter()
        //Act
        let result = sut.convertSecondsClockToLamps(seconds: seconds)
        //Assert
        #expect(result == SecondsLamp.off)
    }
}
