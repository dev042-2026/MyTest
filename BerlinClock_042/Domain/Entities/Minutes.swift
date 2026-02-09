
import Foundation

struct Minutes {
    let value: Int
    
    init?(_ value: Int) {
        guard (0...59).contains(value) else { return nil }
        self.value = value
    }
}

