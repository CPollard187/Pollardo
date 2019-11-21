//
//  CartItems.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-11-18.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import Foundation
import Foundation
import RealmSwift

class ItemsInCart: Object {
    
    @objc dynamic var name: String?
    var price = RealmOptional<Int>()
    
}
