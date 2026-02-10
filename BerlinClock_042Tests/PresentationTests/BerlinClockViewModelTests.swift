
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
}
