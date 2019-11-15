//
//  Menu.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-11-07.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import Foundation
struct Menu: Codable {
    var meals: [Item]
}

struct Item: Codable{
    enum CodingKeys: String, CodingKey {
        
        case name = "strMeal"
        case category = "strCategory"
        case country = "strArea"
        case image = "strMealThumb"
    }
    
    //MARK: - Properties
    var name: String?
    var category: String?
    var country: String?
    var image: String
}
