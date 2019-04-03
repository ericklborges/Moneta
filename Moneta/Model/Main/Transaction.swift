import Foundation

struct Transaction {
    
    let id: String
    var date: Date
    var title: String
    var value: Double
    var origin: String
    
    init(date: Date, title: String, value: Double, origin: String) {
        self.id = UUID().uuidString
        self.date = date
        self.title = title
        self.value = value
        self.origin = origin
    }
    
}

extension Transaction: ConvertableToDatabase {
    typealias DatabaseObjectType = TransactionRealm
    
    init(_ databaseObjectType: DatabaseObjectType) {
        id = databaseObjectType.id
        date = databaseObjectType.date
        title = databaseObjectType.title
        value = databaseObjectType.value
        origin = databaseObjectType.origin
    }
    
    func databaseModel() -> DatabaseObjectType {
        return DatabaseObjectType.build { (build) in
            build.id = id
            build.date = date
            build.title = title
            build.value = value
            build.origin = origin
        }

    }
    
}
