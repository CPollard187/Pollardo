//
//  OrderCompleteViewController.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-11-21.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import UIKit
import RealmSwift

class OrderCompleteViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var totalDue: UILabel!
    @IBOutlet weak var details: UILabel!
    let realm = try! Realm()
    
    lazy var results: Results<ItemsInCart> = { self.realm.objects(ItemsInCart.self) }()
    
    
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Calculate the total cost of the order
        let subtotal = 5 * results.count
        let tax = (subtotal * 13) / 100
        let total = tax + subtotal
        
        //Display pick up deteails and total
        details.text = "Your order has been confirmed! Please be ready to pick up in about 45 minutes."
        totalDue.text = "Total = $\(total).00"
        
        //Delete all of the items in the cart when the order get confirmed
        try! realm.write{
            realm.delete(results)
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
