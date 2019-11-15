//
//  ViewController.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-09-26.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import UIKit

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
        //Testing to see if it displays
        let apiURL = URL(string: "https://www.themealdb.com/images/media/meals/wyxwsp1486979827.jpg")
        
        let task = URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            if error == nil {
                let imageLoaded = UIImage(data: data!)
                
                self.dealImage.image = imageLoaded
            }
        }
        task.resume()
    }


}

