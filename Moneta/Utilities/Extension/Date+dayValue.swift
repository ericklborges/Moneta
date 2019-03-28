import Foundation

public extension Date {
    public func dayInEra() -> Int {
        let gregorianCalendar = Calendar(identifier: .gregorian)
        return gregorianCalendar.ordinality(of: .day, in: .era, for: self) ?? 0
    }
}
