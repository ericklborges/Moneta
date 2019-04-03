import UIKit

class TransactionTableView: UITableView {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect = .zero, style: UITableView.Style = .plain) {
        super.init(frame: frame, style: style)
        setupDesing()
    }
    
    func setupDesing() {
        backgroundColor = .clear
        separatorStyle = .none
    }
    
}
