import Foundation

struct Expense {
    
    let id: String
    var date: Date
    var title: String
    var value: Double
    var account: String
    
    init(date: Date, title: String, value: Double, account: String) {
        self.id = UUID().uuidString
        self.date = date
        self.title = title
        self.value = value
        self.account = account
    }
    
}

extension Expense: ConvertableToDatabase {
    typealias DatabaseObjectType = ExpenseRealm
    
    init(_ expenseRealm: DatabaseObjectType) {
        id = expenseRealm.id
        date = expenseRealm.date
        title = expenseRealm.title
        value = expenseRealm.value
        account = expenseRealm.account
    }
    
    func databaseModel() -> DatabaseObjectType {
        return DatabaseObjectType.build { (build) in
            build.id = id
            build.date = date
            build.title = title
            build.value = value
            build.account = account
        }

    }
    
}
