import Foundation

extension Date {
    
    func dayValue() -> Int {
        let gregorianCalendar = Calendar(identifier: .gregorian)
        return gregorianCalendar.ordinality(of: .day, in: .era, for: self) ?? 0
    }
    
}
