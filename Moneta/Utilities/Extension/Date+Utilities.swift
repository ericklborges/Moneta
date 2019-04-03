import Foundation

public extension Date {
    public func dayInEra() -> Int {
        let gregorianCalendar = Calendar(identifier: .gregorian)
        return gregorianCalendar.ordinality(of: .day, in: .era, for: self) ?? 0
    }

    public func asString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: self)
    }
}
