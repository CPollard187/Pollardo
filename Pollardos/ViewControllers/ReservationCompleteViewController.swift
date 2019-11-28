//
//  ReservationCompleteViewController.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-11-21.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import UIKit
import RealmSwift

class ReservationCompleteViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var details: UILabel!
    
    let realm = try! Realm()
    
    lazy var results: Results<ReservationInformation> = { self.realm.objects(ReservationInformation.self) }()
    
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        details.text = "You're reservation on \(results[0].date!) for the party of \(results[0].name!) for \(results[0].amount!) people, has been booked! See you then!"
        
        //Delete the reservation details when the reservation gets confirmed
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
