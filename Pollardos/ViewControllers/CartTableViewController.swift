//
//  CartTableViewController.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-09-26.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class CartTableViewController: UITableViewController {

    //MARK: Properties
    let realm = try! Realm()
    
    lazy var results: Results<ItemsInCart> = { self.realm.objects(ItemsInCart.self) }()
    
    //MARK: Outlets
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var numberOfItem: UILabel!
    @IBOutlet weak var subtotalCost: UILabel!
    @IBOutlet weak var taxesCost: UILabel!
    @IBOutlet weak var totalCost: UILabel!
    
    
    //MARK: Functions
    @IBAction func checkoutButton(_ sender: Any) {
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let subtotal = 5 * results.count
        let tax = (subtotal * 13) / 100
        let total = tax + subtotal
        
        subtotalCost.text = "$\(subtotal).00"
        taxesCost.text = "$\(tax).00"
        totalCost.text = "$\(total).00"

    }
    
    //Show alert when the user tries to checkout with nothing in the cart
    func alertMessage(){
        let alert = UIAlertController(title: "Pollardos", message: "Please Add An Item To Your Cart", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //get the number of items in the databse and set it to the numberOfRowsInSections
        return results.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartFoodItemsViewCell
        
    
        //Get all of the items at each index
        let item = results[indexPath.row]
        print(item)
        cell.foodName.text = item.name

        return cell
 
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let itemToDelete = results[indexPath.row]
            //Delete that specific item from the database
                try! realm.write {
                    realm.delete(itemToDelete)
                }
            tableView.deleteRows(at: [indexPath], with: .fade)
            viewDidLoad()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
