import Foundation

struct Expense {
    
    var id: String = ""
    var date: Date
    var title: String
    var value: Double
    var account: String
    
    init(_ expenseRealm: ExpenseRealm) {
        date = expenseRealm.date
        title = expenseRealm.title
        value = expenseRealm.value
        account = expenseRealm.account
    }
  
    func asRealm() -> ExpenseRealm {
        return ExpenseRealm.build { (build) in
            build.date = date
            build.title = title
            build.value = value
            build.account = account
        }
    }
    
}
