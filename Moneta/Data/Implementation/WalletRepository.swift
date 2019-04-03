import Foundation

class WalletRepository: EntityRepository {
    typealias Entity = Wallet
    
    private let localRepository: LocalRepository
    
    init(_ localRepository: LocalRepository = RealmRepository()) {
        self.localRepository = localRepository
    }
    
    func create(_ object: Entity) -> Bool {
        return localRepository.create(object)
    }
    
    func update(_ object: Entity) -> Bool {
        return localRepository.update(object)
    }
    
    func delete(_ object: Entity) -> Bool {
        return localRepository.delete(object)
    }
    
    func getAll() -> [Entity] {
        return localRepository.getAll(Entity.self)
    }
    
    func get(with id: String) -> Entity? {
        return localRepository.get(Entity.self, with: id)
    }
}
