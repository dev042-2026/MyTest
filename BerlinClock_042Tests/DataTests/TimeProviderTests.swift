
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
        //Arrange
        let sut = TimeProvider()
        //Act
        let result = sut.getSystemTime()
        //Assert
        #expect(result.minute >= 0 && result.minute < 60)
    }

    @Test func systemTimeProvider_returnsValidSeconds() {
        //Arrange
        let sut = TimeProvider()
        //Act
        let result = sut.getSystemTime()
        //Assert
        #expect(result.second >= 0 && result.second < 60)
    }
    
}

@Suite("Mock Time Provider Test")
struct MockTimeProviderTests {
    @Test func mockTimeProvider_returnsMockedTime()  {
        //Arrange
        let sut = MockTimeProvider()
        sut.mockTime = Time(hour: 23, minute: 59, second: 59)
        //Act
        let result = sut.getSystemTime()
        //Assert
        #expect(result.hour == 23)
        #expect(result.minute == 59)
        #expect(result.second == 59)
    }
}


