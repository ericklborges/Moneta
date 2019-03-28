import RealmSwift

extension Results {
    func asArray<T:ConvertableToDatabase>() -> [T] {
        var elements = [T]()
        for element in self {
            if let object = element as? T.DatabaseObjectType {
                elements.append(T.init(object))
            }
        }
        return elements
    }
}
