import Foundation

extension String {
    
    func asDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: self) ?? Date(timeIntervalSince1970: 1)
    }
    
}
