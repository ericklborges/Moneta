import UIKit

class MainCard: UIView {
    
    var wallet: Wallet
    
    init(_ wallet: Wallet) {
        self.wallet = wallet
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("MainCard.init(coder:) has not been implemented")
    }
    
}
