import Foundation
import RealmSwift

protocol ConvertableToDatabase where DatabaseObjectType: Object {
    associatedtype DatabaseObjectType
    var id: String {get}
    init (_ databaseObjectType: DatabaseObjectType)
    func databaseModel() -> DatabaseObjectType
}
