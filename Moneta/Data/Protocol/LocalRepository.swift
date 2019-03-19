import Foundation

protocol LocalRepository {
    
    func create<T:ConvertableToDatabase>(object: T) -> Bool
    func update<T:ConvertableToDatabase>(object: T) -> Bool
    func delete<T:ConvertableToDatabase>(object: T) -> Bool
    func getAll<T:ConvertableToDatabase>(_ type: T.Type) -> [T]
    func get<T:ConvertableToDatabase>(_ type: T.Type, with id: String) -> T?
    
}

