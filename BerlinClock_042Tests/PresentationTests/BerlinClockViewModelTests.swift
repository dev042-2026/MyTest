
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
}
