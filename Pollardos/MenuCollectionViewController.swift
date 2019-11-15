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

    var results: [Item] = []
    
//    @IBOutlet weak var menuImage: UIImageView!
//    @IBOutlet weak var menuName: UILabel!
    //@IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let apiURL = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=chicken")
        
        //Testing to see if it displays
        //let apiURL = URL(string: "https://www.themealdb.com/images/media/meals/x2fw9e1560460636.jpg")
        results = []
        let task = URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
            if let error = error {
                print("ERROR - \(error)")
            } else {
                    do {
                        guard let data = data else { return }
                        let decoder = JSONDecoder()
                        let downloadedResults = try decoder.decode(Menu.self, from: data)
                        self.results = downloadedResults.results
                        } catch let error {
                            print(error)
                        }
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                    }
                }
                task.resume()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")

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
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return results.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FoodItem
        //FIX ME - Should this be .row?
        let items = results[indexPath.row]
        cell.menuName?.text = items.name
        
        let imageURL = URL(string: items.image)!
        
        //Get the image url and convert into an image
        let imageTask = URLSession.shared.downloadTask(with: imageURL, completionHandler: {
            url,response,error in
            if error == nil,
                let url = url,
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data){
                DispatchQueue.main.async {
                    //FIX ME - cell doesnt have member menuImage
                    cell.menuImage?.image = image
                }
            }
        })
        imageTask.resume()

        // Configure the cell
        return cell
    }
    
    //Connect the detail view screen with the menu view screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "details":
            //get the index of the selected cell
            guard let indexPath = collectionView.indexPath(for: sender as! UICollectionViewCell) else { return }
            //retrieve the menuItem at selected cell
            let menuItem = results[indexPath.row]
            //get the segue destination's controller
            let vc = segue.destination as! DetailViewController
                vc.item = menuItem
        default: return
        }
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
