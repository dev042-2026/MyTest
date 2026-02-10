import SwiftUICore

enum SecondsLamp {
    case on
    case off
    
    var color: Color {
        self == .on ? .yellow : .gray
    }
}

enum FiveHourLamp {
    case redColor
    case noColor
    
    var color: Color {
        self == .redColor ? .red : .gray
    }
}

enum OneHourLamp {
    case redColor
    case noColor
    
    var color: Color {
        self == .redColor ? .red : .gray
    }
}

enum FiveMinuteLamp {
    case redColor
    case yellowColor
    case noColor
}

enum OneMinuteLamp {
    case yellowColor
    case noColor
}
