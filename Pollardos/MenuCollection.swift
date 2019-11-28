//
//  MenuCollection.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-11-14.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import Foundation

struct MenuCollection: Codable {
    var results: [Food]
}

struct Food: Codable{
    
    enum CodingKeys: String, CodingKey {
        
        case name = "strMeal"
        //case category = "strCategory"
        //case country = "strArea"
        case image = "strMealThumb"
        
    }
    //MARK: - Properties
    var name: String
    //var category: String
    //var country: String
    var image: String
}
