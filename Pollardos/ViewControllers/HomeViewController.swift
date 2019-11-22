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
    @IBOutlet weak var pollardoTitle: UILabel!
    @IBOutlet weak var companyInfo: UILabel!
    @IBOutlet weak var deals: UILabel!
    @IBOutlet weak var logo: UIImageView!

    @IBOutlet weak var dealImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Testing to see if it displays
        let apiURL = URL(string: "https://www.themealdb.com/images/media/meals/wyxwsp1486979827.jpg")
        
        companyInfo.text = "Welcome to our Pollardos! We are the top restaurant in the Windsor Essex area that offers chicken cuisine. Cheap and delicious is the motto we live by."
        let task = URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            if error == nil {
                let imageLoaded = UIImage(data: data!)
                
                self.dealImage.image = imageLoaded
            }
        }
        task.resume()
        
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

