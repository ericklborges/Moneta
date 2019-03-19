import Foundation
import RealmSwift

class RealmRepository: LocalRepository {
    
    private let db: Realm
    
    init() {
        //FIXME: Handle Realm Init Error
        self.db = try! Realm()
    }
    
    func create<T:ConvertableToDatabase>(object: T) -> Bool {
        do {
            try db.write {
                db.add(object.databaseModel())
            }
            return true
        } catch let error as NSError {
            print(error)
            return false
        }
    }
    
    func update<T:ConvertableToDatabase>(object: T) -> Bool {
        do {
            try db.write {
                db.add(object.databaseModel(),update: true)
            }
            return true
        } catch let error as NSError {
            print(error)
            return false
        }
    }
    
    func getAll<T:ConvertableToDatabase>(_ type: T.Type) -> [T] {
        return db.objects(type.DatabaseObjectType.self).asArray()
    }
    
    func get<T:ConvertableToDatabase>(_ type: T.Type, with id: String) -> T? {
        if let object = db.object(ofType: type.DatabaseObjectType.self, forPrimaryKey: id) {
            return T.init(object)
        } else {
            return nil
        }
    }
    
    func delete<T:ConvertableToDatabase>(object: T) -> Bool {
        do {
            try db.write {
                db.delete(object.databaseModel())
            }
            return true
        } catch let error as NSError {
            print(error)
            return false
        }
    }
    
}
