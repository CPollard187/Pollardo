//
//  DetailViewController.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-10-24.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {

    var item: Item?
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodTitle: UILabel!
    @IBOutlet weak var foodCategory: UILabel!
    @IBOutlet weak var foodCountry: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    
    @IBAction func addToCart(_ sender: Any) {
        //let addItem = foodTitle.text
        
        let realm = try! Realm()
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
        var name = ItemsInCart()
        name.name = foodTitle.text
        name.price.value = 5
        
        try! realm.write{
            realm.add(name)
        }
    }
    
    @IBAction func scaleMenuImage(_ sender: UIPinchGestureRecognizer) {
        foodImage.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        switch segue.identifier{
//        case "addToCart":
//            let itemAdded = foodTitle.text
//            //get the segue destination's controller
//            let vc = segue.destination as! CartTableViewController
//            vc.foodTitle = itemAdded
//
//        default: return
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let items = results[indexPath.row]
        

        if let menuItem = item {
            foodTitle.text = menuItem.name
            foodCategory.text = menuItem.category
            foodCountry.text = menuItem.country
            let imageURL = URL(string: menuItem.image)!
            let imageTask = URLSession.shared.downloadTask(with: imageURL, completionHandler: {
                url,response,error in
                if error == nil,
                    let url = url,
                    let data = try? Data(contentsOf: url),
                    let image = UIImage(data: data){
                    
                    DispatchQueue.main.async {
                        self.foodImage.image = image
                    }
                }
            })
            imageTask.resume()
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
