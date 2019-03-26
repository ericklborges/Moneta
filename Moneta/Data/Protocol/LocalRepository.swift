import Foundation

protocol LocalRepository {
    func create<T:ConvertableToDatabase>(_ object: T) -> Bool
    func update<T:ConvertableToDatabase>(_ object: T) -> Bool
    func delete<T:ConvertableToDatabase>(_ object: T) -> Bool
    func getAll<T:ConvertableToDatabase>(_ type: T.Type) -> [T]
    func get<T:ConvertableToDatabase>(_ type: T.Type, with id: String) -> T?
}
