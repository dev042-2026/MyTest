
import Testing

@testable import BerlinClock_042

@Suite("Berlin Clock ViewModel Validations")
struct BerlinClockViewModelTests {
    
    
    @Test
    func viewModel_whenSecondsIsZero_secondsLampIsOn() {
        //Arrange
        let sut = BerlinClockViewModel()
        //Act
        let result = sut.secondsLampState(secondFieldData: 00)
        //Assert
        #expect(result == .on)
    }
    
    
    @Test
    func viewModel_when_HoursIsZero_fiveHourLamps_allOff() {
        //Arrange
        let sut = BerlinClockViewModel()
        //Act
        let result = sut.fiveHourLampState(hourFieldData: 00)
        //Assert
        #expect(result == [.noColor, .noColor, .noColor, .noColor])
    }
    
    @Test
    func viewModel_whenHoursIsZero_oneHourLampsAllOff() {
        //Arrange
        let sut = BerlinClockViewModel()
        //Act
        let result = sut.oneHourLampState(hourFieldData: 00)
        //Assert
        #expect(result == [.noColor, .noColor, .noColor, .noColor])
    }
    
    @Test
    func viewModel_whenMinutesIsZero_fiveMinuteLampsAllOff() {
        //Arrange
        let sut = BerlinClockViewModel()
        //Act
        let result = sut.fiveMinuteLampState(minuteFieldData: 00)
        //Assert
        #expect(result == [.noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor, .noColor])
    }
    
    @Test
    func viewModel_whenMinutesIsZero_oneMinuteLampsAllOff() {
        //Arrange
        let sut = BerlinClockViewModel()
        //Act
        let result = sut.oneMinuteLampState(minuteFieldData: 00)
        //Assert
        #expect(result == [.noColor, .noColor, .noColor, .noColor])
    }
    
    @Test
    func viewModel_whenSystemTimeIs235959_secondLamp_Correct() {
        // Arrange
        let mockProvider = MockTimeProvider()
        mockProvider.mockTime = Time(hour: 23, minute: 59, second: 59)
        let sut = BerlinClockViewModel(timeProvider: mockProvider)
        //Act
        sut.updateFromSystemTime()
        //Assert
        #expect(sut.secondsLamp == .off)
    }
    
    @Test
    func viewModel_whenSystemTimeIs235959_minutesLamps_Correct() {
        //Arrange
        let mockProvider = MockTimeProvider()
        mockProvider.mockTime = Time(hour: 23, minute: 59, second: 59)
        let sut = BerlinClockViewModel(timeProvider: mockProvider)
        //Act
        sut.updateFromSystemTime()
        //Assert
        #expect(sut.fiveMinuteLamps == [.yellowColor, .yellowColor, .redColor, .yellowColor, .yellowColor, .redColor, .yellowColor, .yellowColor, .redColor, .yellowColor, .yellowColor])
        #expect(sut.oneMinuteLamps == [.yellowColor, .yellowColor, .yellowColor, .yellowColor])
    }
    
    @Test
    func viewModel_whenSystemTimeIs235959_hourLamps_Correct() {
        // Arrange
        let mockProvider = MockTimeProvider()
        mockProvider.mockTime = Time(hour: 23, minute: 59, second: 59)
        let sut = BerlinClockViewModel(timeProvider: mockProvider)
        //Act
        sut.updateFromSystemTime()
        //Assert
        #expect(sut.fiveHourLamps == [.redColor, .redColor, .redColor, .redColor])
        #expect(sut.oneHourLamps == [.redColor, .redColor, .redColor, .noColor])
    }
}
