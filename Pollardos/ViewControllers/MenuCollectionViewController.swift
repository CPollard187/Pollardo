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

    //MARK: Properties
    var results: [Item] = []
    
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView!.delegate = self
        collectionView!.dataSource = self
        
        let apiURL = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=chicken")
        
        results = []
        
        let task = URLSession.shared.dataTask(with: apiURL!) { (data, response, error) in
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
                            self.collectionView!.reloadData()
                        }
                    }
                }
                task.resume()
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
        return results.count - 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FoodItem

        //Get each result from the api
        let items = results[indexPath.row]
        //Get the name of the meal and set it too the label
        cell.menuName?.text = items.name
        
        //Get the image URL from the API
        let imageURL = URL(string: items.image)!
        
        //Get the image url and convert into an image
        let imageTask = URLSession.shared.downloadTask(with: imageURL, completionHandler: {
            url,response,error in
            if error == nil,
                let url = url,
                let data = try? Data(contentsOf: url),
                let image = UIImage(data: data){
                DispatchQueue.main.async {
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
            guard let indexPath = collectionView!.indexPath(for: sender as! UICollectionViewCell) else { return }
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
