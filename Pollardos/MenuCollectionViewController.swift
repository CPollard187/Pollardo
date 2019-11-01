//
//  MenuCollectionViewController.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-09-26.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import UIKit


//private let api = MealDB()

class MenuCollectionViewController: UICollectionViewController {

    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuName: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiURL = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=chicken")
        
        //Testing to see if it displays
        //let apiURL = URL(string: "https://www.themealdb.com/images/media/meals/x2fw9e1560460636.jpg")
        
        let task = URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    
                    let parsedData = try JSONSerialization.jsonObject(with: data!) as! [[String : Any]]
                    for item in parsedData
                    {
                        //Pull the String thats under the item strMeal
                        //Display it in the menuName Label as text
                        let nameLoaded = item["strMeal"] as! String
                        self.menuName.text = nameLoaded
                        
                        //Pull the string of the image strMealThumb
                        //Display it as a UIImage
                        let imageLoaded = item["strMealThumb"] as! UIImage
                        self.menuImage.image = imageLoaded
                    }
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }

//            if error == nil {
//                let imageLoaded = UIImage(data: data!)
//
//                self.menuImage.image = imageLoaded
//
//            }
        }
        task.resume()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        // Do any additional setup after loading the view.
    }    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        //cell.menuImage.image = menuImage
        
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
