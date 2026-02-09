
import Testing

@testable import BerlinClock_042

@Suite("Five Minute clock Conversion validation")
struct FiveMinuteClockConverterTests {
    
    @Test(arguments: [0, 30, 59])
    func fiveMinuteClockConverter_Validate_LampCount(minutes: Int) {
        //Arrange
        let fiveMinuteClockConverter = FiveMinuteClockConverter()
        //Act
        let result = fiveMinuteClockConverter.convertToFiveMinuteLamp(minutes: minutes)
        //Assert
        #expect(result.count == 11)
    }
    
}

