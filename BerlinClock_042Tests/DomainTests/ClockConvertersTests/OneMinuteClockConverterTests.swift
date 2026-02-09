
import Testing

@testable import BerlinClock_042

@Suite("One Minute clock Conversion validation")
struct OneMinuteClockConverterTests {
    
    @Test
    func oneMinuteClockConverter_Validate_LampCount() {
        //Arrange
        let oneMinuteClockConverter = OneMinuteClockConverter()
        //Act
        let result = oneMinuteClockConverter.convertToOneMinuteLamp()
        //Assert
        #expect(result.count == 4)
    }
}
