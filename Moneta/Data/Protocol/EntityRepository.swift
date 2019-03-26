//
//  a.swift
//  Moneta
//
//  Created by Erick Lozano Borges on 26/03/19.
//  Copyright © 2019 Erick Lozano Borges. All rights reserved.
//

import Foundation

protocol EntityRepository {
    associatedtype Entity
    func create(_ object: Entity) -> Bool
    func update(_ object: Entity) -> Bool
    func delete(_ object: Entity) -> Bool
    func getAll() -> [Entity]
    func get(with id: String) -> Entity?
}
