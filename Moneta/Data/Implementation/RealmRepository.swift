import Foundation
import RealmSwift

class RealmRepository: LocalRepository {
    private let db: Realm
    
    init() {
        //FIXME: Handle Realm Init Error
        self.db = try! Realm()
    }
    
    func create<T:ConvertableToDatabase>(_ object: T) -> Bool {
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
    
    func update<T:ConvertableToDatabase>(_ object: T) -> Bool {
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
        if let object = db.object(ofType: T.DatabaseObjectType.self, forPrimaryKey: id) {
            return T.init(object)
        } else {
            return nil
        }
    }
    
    func delete<T:ConvertableToDatabase>(_ object: T) -> Bool {
        
        guard let deletedObject = db.object(ofType: T.DatabaseObjectType.self, forPrimaryKey: object.id) else {
            return false
        }
        
        do {
            try db.write {
                db.delete(deletedObject)
            }
            return true
        } catch let error as NSError {
            print(error)
            return false
        }
    }
    
}
