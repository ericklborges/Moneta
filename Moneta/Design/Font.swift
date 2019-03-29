import UIKit

enum TextStyle {
    
    case detail
    case titleSmall
    case highlightBig
    case amountOfMoney
    
    func uiFont() -> UIFont {
        switch self {
        case .detail:
            return UIFont(name: "SFCompactRounded-Medium", size: 12) ?? UIFont()
        case .titleSmall:
            return UIFont(name: "SFCompactRounded-Medium", size: 15) ?? UIFont()
        case .highlightBig:
            return UIFont(name: "SFCompactRounded-Semibold", size: 40) ?? UIFont()
        case .amountOfMoney:
            return UIFont(name: "SFProDisplay-Medium", size: 15) ?? UIFont()
        }
    }
    
}
