
import Testing

@testable import BerlinClock_042

@Suite("Time Provider Test")
struct TimeProviderTests {
   
    @Test func systemTimeProvider_returnsValidHours() {
        //Arrange
        let sut = TimeProvider()
        //Act
        let result = sut.getSystemTime()
        //Assert
        #expect(result.hour >= 0 && result.hour < 24)
    }
    
    @Test func systemTimeProvider_returnsValidMinutes() {
        let sut = TimeProvider()
        let result = sut.getSystemTime()
        #expect(result.minute >= 0 && result.minute < 60)
    }

    @Test func systemTimeProvider_returnsValidSeconds() {
        let sut = TimeProvider()
        let result = sut.getSystemTime()
        #expect(result.second >= 0 && result.second < 60)
    }
}

