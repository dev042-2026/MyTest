
import Testing

@testable import BerlinClock_042

@Suite("Five Minute clock Conversion validation")
struct FiveMinuteClockConverterTests {
    
    @Test(arguments: [Minutes(0)!, Minutes(30)!, Minutes(59)!])
    func fiveMinuteClockConverter_Validate_LampCount(minutes: Minutes) {
        //Arrange
        let fiveMinuteClockConverter = FiveMinuteClockConverter()
        //Act
        let result = fiveMinuteClockConverter.convertToFiveMinuteLamp(minutes: minutes)
        //Assert
        #expect(result.count == 11)
    }
    
    @Test(arguments: [Minutes(0)!, Minutes(1)!, Minutes(4)!])
    func fiveMinuteConverter_when_lessThanFive_allOff(minutes: Minutes) {
        //Arrange
        let fiveMinuteClockConverter = FiveMinuteClockConverter()
        //Act
        let result = fiveMinuteClockConverter.convertToFiveMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor])
    }
    
    @Test(arguments: [Minutes(5)!, Minutes(6)!, Minutes(9)!])
    func fiveMinuteConverter_when_fiveToNine_oneLampOn(minutes: Minutes) {
        //Arrange
        let fiveMinuteClockConverter = FiveMinuteClockConverter()
        //Act
        let result = fiveMinuteClockConverter.convertToFiveMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.yellowColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor])
    }
    
    @Test(arguments: [Minutes(10)!, Minutes(12)!, Minutes(14)!])
    func fiveMinuteConverter_when_tenToFourteen_twoLampsOn(minutes: Minutes) {
        //Arrange
        let fiveMinuteClockConverter = FiveMinuteClockConverter()
        //Act
        let result = fiveMinuteClockConverter.convertToFiveMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.yellowColor, .yellowColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor])
    }
    
    @Test(arguments: [Minutes(15)!, Minutes(17)!, Minutes(19)!])
    func fiveMinuteConverter_when_fifteenToNineteen_threeLampsOn(minutes: Minutes) {
        //Arrange
        let fiveMinuteClockConverter = FiveMinuteClockConverter()
        //Act
        let result = fiveMinuteClockConverter.convertToFiveMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.yellowColor, .yellowColor, .redColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor])
    }
    
    @Test(arguments: [Minutes(30)!, Minutes(32)!, Minutes(34)!])
    func fiveMinuteConverter_when_thirtyToThirtyFour_sixLampsOn(minutes: Minutes) {
        //Arrange
        let fiveMinuteClockConverter = FiveMinuteClockConverter()
        //Act
        let result = fiveMinuteClockConverter.convertToFiveMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.yellowColor, .yellowColor, .redColor, .yellowColor, .yellowColor, .redColor, .noColor, .noColor, .noColor, .noColor, .noColor])
    }
    
    @Test(arguments: [Minutes(45)!, Minutes(47)!, Minutes(49)!])
    func fiveMinuteConverter_when_fortyFiveToFortyNine_nineLampsOn(minutes: Minutes) {
        //Arrange
        let fiveMinuteClockConverter = FiveMinuteClockConverter()
        //Act
        let result = fiveMinuteClockConverter.convertToFiveMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.yellowColor, .yellowColor, .redColor, .yellowColor, .yellowColor, .redColor, .yellowColor, .yellowColor, .redColor, .noColor, .noColor])
    }
    
    @Test(arguments: [Minutes(55)!, Minutes(57)!, Minutes(59)!])
    func fiveMinuteConverter_when_fiftyFiveToFiftyNine_allLampsOn(minutes: Minutes) {
        //Arrange
        let fiveMinuteClockConverter = FiveMinuteClockConverter()
        //Act
        let result = fiveMinuteClockConverter.convertToFiveMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.yellowColor, .yellowColor, .redColor, .yellowColor, .yellowColor, .redColor, .yellowColor, .yellowColor, .redColor, .yellowColor, .yellowColor])
    }
}

