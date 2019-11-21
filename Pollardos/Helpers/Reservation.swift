//
//  Reservation.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-11-21.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import Foundation
import RealmSwift

class Reservation: Object {
    
    @objc dynamic var name: String?
    @objc dynamic var amount: String?
    @objc dynamic var month: String?
    @objc dynamic var day: String?
    @objc dynamic var time: String?
    
}
