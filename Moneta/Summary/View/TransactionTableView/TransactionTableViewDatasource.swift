import UIKit
import Reusable

class TransactionTableViewDatasource: NSObject, UITableViewDataSource {
    
    var transactions: [Transaction]
    
    init(_ transactions: [Transaction], tableView: UITableView) {
        self.transactions = transactions
        super.init()
        registerCells(in: tableView)
    }
    
    private func registerCells(in tableView: UITableView) {
        tableView.register(cellType: TransactionTableViewCell.self)
        tableView.register(cellType: AddTransactionTableViewCell.self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: TransactionTableViewCell.self)
        cell.setup(with: transactions[indexPath.row])
        return cell
    }

}
