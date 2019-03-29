import UIKit

enum Color {
    
    case offWihte
    case titleText
    case highlight
    case moneyText
    case darkBackground
    
    func uiColor() -> UIColor {
        switch self {
        case .offWihte:
            return UIColor(red:0.85, green:0.85, blue:0.87, alpha:1)
        case .titleText:
            return UIColor(red:0.68, green:0.68, blue:0.7, alpha:1)
        case .highlight:
            return UIColor(red:0.26, green:0.56, blue:0.73, alpha:1)
        case .moneyText:
            return UIColor(red:0.31, green:0.72, blue:0.43, alpha:1)
        case .darkBackground:
            return UIColor(red:0.22, green:0.22, blue:0.28, alpha:1)
        }
    }
    
}
