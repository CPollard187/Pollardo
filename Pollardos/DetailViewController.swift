//
//  DetailViewController.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-10-24.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var item: Menu?
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!
    @IBOutlet weak var foodCategory: UILabel!
    @IBOutlet weak var foodCountry: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let menuItem = item {
            //FIX ME - Menu has no member "-----"
            foodTitle.text = menuItem.name
            foodCategory.text = menuItem.category
            foodCountry.text = menuItem.country
            foodImage.image = menuItem.image
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
