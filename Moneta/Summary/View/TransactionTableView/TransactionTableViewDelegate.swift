import UIKit

protocol TransactionSelectionDelegate: class {
    func didSelectAddTransaction()
    func didSelect(_ transaction: Transaction)
}

class TransactionTableViewDelegate: NSObject, UITableViewDelegate {
    
    weak var delegate: TransactionSelectionDelegate?
    
    init(delegate: TransactionSelectionDelegate) {
        self.delegate = delegate
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? TransactionTableViewCell,
            let transaction = cell.transaction {
            delegate?.didSelect(transaction)
        } else if tableView.cellForRow(at: indexPath) is AddTransactionTableViewCell {
            delegate?.didSelectAddTransaction()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenHeight = UIScreen.main.bounds.height
        let cellHeight = screenHeight * (72/812)
        return cellHeight
    }
    
}
