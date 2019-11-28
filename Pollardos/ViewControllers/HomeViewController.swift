//
//  ViewController.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-09-26.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import UIKit
import RealmSwift
import CoreSpotlight

class HomeViewController: UIViewController {

    //MARK: OUTLETS
    @IBOutlet weak var companyInfo: UILabel!
    @IBOutlet weak var deals: UILabel!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var menuName: UILabel!
    @IBOutlet weak var dealImage: UIImageView!
    var results: [Item] = []
    
    
    //MARK: FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        getNameDeal()
        getImageDeal()
        
        companyInfo.text = "Welcome to our Pollardos! We are the top restaurant in the Windsor Essex area that offers chicken cuisine. Cheap and delicious is the motto we live by."
    }

    //When they click the image it will add that item to the cart
    @IBAction func sendToCart(_ sender: UIButton) {
        addItemToCart()
    }
    
    //Get the name of the label and add it to the database
    func addItemToCart(){
        let realm = try! Realm()
        
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        
        let cartItem = ItemsInCart()
        cartItem.name = menuName.text
        cartItem.price.value = 5
        
        try! realm.write{
            realm.add(cartItem)
        }
    }
    
    //Get the image from the API
    func getImageDeal(){
        let imageURL = URL(string: "https://www.themealdb.com/images/media/meals/qxytrx1511304021.jpg")
        let task = URLSession.shared.dataTask(with: imageURL!) { (data, response, error) in
            if error == nil {
                let imageLoaded = UIImage(data: data!)
                self.dealImage.image = imageLoaded
            }
        }
        task.resume()
    }
    
    //get the name of the meal from the API
    func getNameDeal(){
        let apiURL = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=chicken")
        results = []
        let nameTask = URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            if let error = error {
                print("ERROR - \(error)")
            } else {
                do {
                    guard let data = data else { return }
                    let decoder = JSONDecoder()
                    let downloadedResults = try decoder.decode(Menu.self, from: data)
                    self.results = downloadedResults.meals
                } catch let error {
                    print(error)
                }
                DispatchQueue.main.async {
                    self.menuName.text = self.results[5].name
                }
            }
        }
        nameTask.resume()
    }
    
    //Spotlight search
    //When the user searches for 'Pollardos Application' it will show my app
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let userActivity = NSUserActivity(activityType: "ca.stclairconnect.01pollard.cody.Pollardos.openTab")
            userActivity.title = "Pollardos Application"
            userActivity.isEligibleForSearch = true
            userActivity.isEligibleForPublicIndexing = true
            self.userActivity = userActivity
            self.userActivity?.becomeCurrent()
    }
}


