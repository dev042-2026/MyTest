
import Testing

@testable import BerlinClock_042

@Suite("One Minute clock Conversion validation")
struct OneMinuteClockConverterTests {
    
    @Test(arguments: [Minutes(0)!, Minutes(30)!, Minutes(59)!])
    func oneMinuteClockConverter_Validate_LampCount(minutes: Minutes) {
        //Arrange
        let oneMinuteClockConverter = OneMinuteClockConverter()
        //Act
        let result = oneMinuteClockConverter.convertToOneMinuteLamp(minutes: minutes)
        //Assert
        #expect(result.count == 4)
    }
    
    @Test(arguments: [Minutes(0)!, Minutes(5)!, Minutes(10)!, Minutes(55)!])
    func oneMinuteConverter_when_zeroLampsOn(minutes: Minutes) {
        //Arrange
        let oneMinuteClockConverter = OneMinuteClockConverter()
        //Act
        let result = oneMinuteClockConverter.convertToOneMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.noColor, .noColor, .noColor, .noColor])
    }
}
