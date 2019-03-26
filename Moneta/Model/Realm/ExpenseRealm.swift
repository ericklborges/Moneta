import Foundation
import RealmSwift

class ExpenseRealm: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var date: Date = Date(timeIntervalSince1970: 1)
    @objc dynamic var title: String = ""
    @objc dynamic var value: Double = 0.0
    @objc dynamic var account: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
