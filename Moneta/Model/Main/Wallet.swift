import Foundation

struct Wallet {
    
    public let id: String
    public let limit: Double
    public var label: String
    public let startDate: Date
    public let endDate: Date
    public var transactions = [Transaction]()
    private(set) var balance: Double {
        get { return totalTransactionsValue() / daysLeft() }
        set {}
    }
    
    init(limit: Double, label: String, startDate: Date, endDate: Date) {
        self.id = UUID().uuidString
        self.limit = limit
        self.label = label
        self.startDate = startDate
        self.endDate = endDate
        self.balance = limit
    }
    
    public func dailyValue() -> Double {
        return balance / daysLeft()
    }
    
    public func daysLeft() -> Double {
        return Double(endDate.dayInEra() - startDate.dayInEra())
    }
    
    public func totalTransactionsValue() -> Double {
        return transactions.reduce(0) { (x, y) -> Double in
            return x + y.value
        }
    }
}

extension Wallet: ConvertableToDatabase {
    typealias DatabaseObjectType = WalletRealm
    
    init(_ databaseObjectType: DatabaseObjectType) {
        self.id = databaseObjectType.id
        self.limit = databaseObjectType.limit
        self.label =  databaseObjectType.label
        self.startDate = databaseObjectType.startDate
        self.endDate = databaseObjectType.endDate
        self.transactions = databaseObjectType.transactions.map { Transaction($0) }
    }
    
    func databaseModel() -> DatabaseObjectType {
        return DatabaseObjectType.build({ (build) in
            build.id = id
            build.limit = limit
            build.label = label
            build.startDate = startDate
            build.endDate = endDate
            build.transactions.append(objectsIn: transactions.map { $0.databaseModel() })
        })
    }
    
    
}
