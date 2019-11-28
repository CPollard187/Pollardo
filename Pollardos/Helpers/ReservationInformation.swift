//
//  ReservationInformation.swift
//  
//
//  Created by Sabrina Gaspar on 2019-11-27.
//

import Foundation
import RealmSwift

class ReservationInformation: Object {
    
    @objc dynamic var name: String?
    @objc dynamic var amount: String?
    //    @objc dynamic var month: String?
    //    @objc dynamic var day: String?
    //    @objc dynamic var time: String?
    @objc dynamic var date: String?
}
