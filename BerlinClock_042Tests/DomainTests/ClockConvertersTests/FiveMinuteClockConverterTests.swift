
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
    
    @Test(arguments: [0, 1, 4])
    func fiveMinuteConverter_when_lessThanFive_allOff(minutes: Int) {
        //Arrange
        let fiveMinuteClockConverter = FiveMinuteClockConverter()
        //Act
        let result = fiveMinuteClockConverter.convertToFiveMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor])
    }
    
    @Test(arguments: [5, 6, 9])
    func fiveMinuteConverter_when_fiveToNine_oneLampOn(minutes: Int) {
        //Arrange
        let fiveMinuteClockConverter = FiveMinuteClockConverter()
        //Act
        let result = fiveMinuteClockConverter.convertToFiveMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.yellowColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor])
    }
    
    @Test(arguments: [10, 12, 14])
    func fiveMinuteConverter_when_tenToFourteen_twoLampsOn(minutes: Int) {
        //Arrange
        let fiveMinuteClockConverter = FiveMinuteClockConverter()
        //Act
        let result = fiveMinuteClockConverter.convertToFiveMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.yellowColor, .yellowColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor])
    }
    
    @Test(arguments: [15, 17, 19])
    func fiveMinuteConverter_when_fifteenToNineteen_threeLampsOn(minutes: Int) {
        //Arrange
        let fiveMinuteClockConverter = FiveMinuteClockConverter()
        //Act
        let result = fiveMinuteClockConverter.convertToFiveMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.yellowColor, .yellowColor, .redColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor])
    }
    
    @Test(arguments: [30, 32, 34])
    func fiveMinuteConverter_when_thirtyToThirtyFour_sixLampsOn(minutes: Int) {
        //Arrange
        let fiveMinuteClockConverter = FiveMinuteClockConverter()
        //Act
        let result = fiveMinuteClockConverter.convertToFiveMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.yellowColor, .yellowColor, .redColor, .yellowColor, .yellowColor, .redColor, .noColor, .noColor, .noColor, .noColor, .noColor])
    }
    
    @Test(arguments: [45, 47, 49])
    func fiveMinuteConverter_when_fortyFiveToFortyNine_nineLampsOn(minutes: Int) {
        //Arrange
        let fiveMinuteClockConverter = FiveMinuteClockConverter()
        //Act
        let result = fiveMinuteClockConverter.convertToFiveMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.yellowColor, .yellowColor, .redColor, .yellowColor, .yellowColor, .redColor, .yellowColor, .yellowColor, .redColor, .noColor, .noColor])
    }
    
    @Test(arguments: [55, 57, 59])
    func fiveMinuteConverter_when_fiftyFiveToFiftyNine_allLampsOn(minutes: Int) {
        //Arrange
        let fiveMinuteClockConverter = FiveMinuteClockConverter()
        //Act
        let result = fiveMinuteClockConverter.convertToFiveMinuteLamp(minutes: minutes)
        //Assert
        #expect(result == [.yellowColor, .yellowColor, .redColor, .yellowColor, .yellowColor, .redColor, .yellowColor, .yellowColor, .redColor, .yellowColor, .yellowColor])
    }
}

