import Foundation
import RealmSwift

class WalletRealm: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var limit: Double = 0.0
    @objc dynamic var label: String = ""
    @objc dynamic var startDate: Date = Date(timeIntervalSince1970: 1)
    @objc dynamic var endDate: Date = Date(timeIntervalSince1970: 1)
    let transactions = List<TransactionRealm>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
