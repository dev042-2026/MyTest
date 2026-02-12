
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

@Suite("Berlin Live Clock ViewModel Validations")
struct BerlinClockViewModel_LiveTests {
    
    @Test func viewModel_isLiveMode_defaultsToTrue() {
        // Arrange
        let mockProvider = MockTimeProvider()
        //Act
        let sut = BerlinClockViewModel(timeProvider: mockProvider)
        //Assert
        #expect(sut.isLiveMode == true)
    }
    
    @Test func viewModel_stopLiveMode_setsToFalse() {
        // Arrange
        let mockProvider = MockTimeProvider()
        //Act
        let sut = BerlinClockViewModel(timeProvider: mockProvider)
        sut.stopLiveMode()
        //Assert
        #expect(sut.isLiveMode == false)
    }
    
    @Test func viewModel_startLiveMode_setsToTrue() {
        // Arrange
        let mockProvider = MockTimeProvider()
        // Act
        let sut = BerlinClockViewModel(timeProvider: mockProvider)
    
        sut.stopLiveMode()
        sut.startLiveMode()
        //Assert
        #expect(sut.isLiveMode == true)
    }
    
    @Test func viewModel_convert_stopsLiveMode() {
        //Arrange
        let mockProvider = MockTimeProvider()
        //Act
        let sut = BerlinClockViewModel(timeProvider: mockProvider)
        sut.convert(hours: 12, minutes: 30, seconds: 0)
        //Assert
        #expect(sut.isLiveMode == false)
    }

}

@Suite("Berlin Clock ViewModel Error Handling Validations")
struct BerlingClockViewModel_ErrorTests {
    
    @Test func viewModel_convert_invalidHour_setsError() {
        // Arrange
        let mockProvider = MockTimeProvider()
        //Act
        let sut = BerlinClockViewModel(timeProvider: mockProvider)
        sut.convert(hours: 25, minutes: 0, seconds: 0)
        //Assert
        #expect(sut.errorMessage == "Invalid hour (0-23)")
    }
    
    @Test func viewModel_convert_invalidMinute_setsError() {
        // Arrange
        let mockProvider = MockTimeProvider()
        //Act
        let sut = BerlinClockViewModel(timeProvider: mockProvider)
        sut.convert(hours: 23, minutes: 62, seconds: 0)
        //Assert
        #expect(sut.errorMessage == "Invalid minute (0-59)")
    }
    
}

