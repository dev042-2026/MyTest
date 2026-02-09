
import Testing
@testable import BerlinClock_042

@Suite("Five Hour clock convertion validation")
struct FiveHourClockConverterTests {
    
    @Test(arguments: [FiveHour(4)!,FiveHour(23)!])
    func fiveHourClockConverter_Validate_LampCount(hours: FiveHour) {
        //Arrange
        let fiveHoursConverter = FiveHourClockConverter()
        //Act
        let result = fiveHoursConverter.convertToFiveHourLamp(hours: hours)
        //Assert
        #expect(result.count == 4)
    }
    
    @Test(arguments: [FiveHour(0)!,FiveHour(1)!,FiveHour(4)!])
    func fiveHourClockConver_when_value_lessThanFive(hours: FiveHour) {
        //Arrange
        let fiveHoursConverter = FiveHourClockConverter()
        //Act
        let result = fiveHoursConverter.convertToFiveHourLamp(hours: hours)
        //Asser
        #expect(result == [.noColor, .noColor, .noColor, .noColor])
    }
    
    @Test(arguments: [FiveHour(5)!,FiveHour(9)!])
    func fiveHourClockConverter_when_value_fiveToNine(hours: FiveHour) {
        //Arrange
        let fiveHoursConverter = FiveHourClockConverter()
        //Act
        let result = fiveHoursConverter.convertToFiveHourLamp(hours: hours)
        //Assert
        #expect(result == [.redColor, .noColor, .noColor, .noColor])
    }
    
    @Test(arguments: [FiveHour(10)!,FiveHour(14)!])
    func fiveHourClockConverter_when_value_TenToFourteen(hours: FiveHour) {
        //Arrange
        let fiveHoursConverter = FiveHourClockConverter()
        //Act
        let result = fiveHoursConverter.convertToFiveHourLamp(hours: hours)
        //Assert
        #expect(result == [.redColor, .redColor, .noColor, .noColor])
    }
}
