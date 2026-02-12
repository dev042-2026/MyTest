
struct Seconds {
    let value: Int
    
    init?(_ value: Int) {
        guard (BerlinClockConstants.TimeRange.seconds).contains(value) else { return nil }
        self.value = value
    }
}
