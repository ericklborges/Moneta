//
//  Object+Builder.swift
//  Moneta
//
//  Created by Erick Lozano Borges on 18/03/19.
//  Copyright © 2019 Erick Lozano Borges. All rights reserved.
//

import RealmSwift

extension Object {
    
    static func build<T:Object>(_ builder: (T) -> Void ) -> T {
        let realm = T()
        builder(realm)
        return realm
    }
    
}
