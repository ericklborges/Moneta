import Foundation
import RealmSwift

protocol ConvertableToDatabase where DatabaseObjectType: Object {
    associatedtype DatabaseObjectType
    init (_ databaseObjectType: DatabaseObjectType)
    func databaseModel() -> DatabaseObjectType
}
