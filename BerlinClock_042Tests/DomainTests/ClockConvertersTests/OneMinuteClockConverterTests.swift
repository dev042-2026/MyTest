
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
    
    @Test(arguments: [Minutes(1)!, Minutes(6)!, Minutes(11)!, Minutes(56)!])
    func oneMinuteConverter_when_oneLampOn(minutes: Minutes) {
        //Arrange
        let oneMinuteClockConverter = OneMinuteClockConverter()
        //Act
        let result = oneMinuteClockConverter.convertToOneMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.yellowColor, .noColor, .noColor, .noColor])
    }
    
    @Test(arguments: [Minutes(2)!, Minutes(7)!, Minutes(12)!, Minutes(57)!])
    func oneMinuteConverter_when_twoLampsOn(minutes: Minutes) {
        //Arrange
        let oneMinuteClockConverter = OneMinuteClockConverter()
        //Act
        let result = oneMinuteClockConverter.convertToOneMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.yellowColor, .yellowColor, .noColor, .noColor])
    }
    
    @Test(arguments: [Minutes(3)!, Minutes(8)!, Minutes(13)!, Minutes(58)!])
    func oneMinuteConverter_when_threeLampsOn(minutes: Minutes) {
        //Arrange
        let oneMinuteClockConverter = OneMinuteClockConverter()
        //Act
        let result = oneMinuteClockConverter.convertToOneMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.yellowColor, .yellowColor, .yellowColor, .noColor])
    }
    
    @Test(arguments: [Minutes(4)!, Minutes(9)!, Minutes(14)!, Minutes(59)!])
    func oneMinuteConverter_when_fourLampsOn(minutes: Minutes) {
        //Arrange
        let oneMinuteClockConverter = OneMinuteClockConverter()
        //Act
        let result = oneMinuteClockConverter.convertToOneMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.yellowColor, .yellowColor, .yellowColor, .yellowColor])
    }
}
