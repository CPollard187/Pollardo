//
//  CartFoodItems.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-11-14.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import Foundation
import UIKit

class CartFoodItemsViewCell: UITableViewCell {
    
    
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var numOfItem: UILabel!
    @IBAction func moreItems(_ sender: UIStepper) {
        numOfItem.text = Int(sender.value).description
    }
    
    
}
