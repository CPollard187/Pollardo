//
//  ReservationViewController.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-10-24.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import UIKit
import MessageUI
import UserNotifications
import RealmSwift

class ReservationViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    //MARK: Properites
    var badgeCount = 0
    var date: String = ""

    //MARK: Outlets
    @IBOutlet weak var partyName: UITextField!
    @IBOutlet weak var partyAmount: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var blurb: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!

    //MARK: Functions
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        date = dateFormatter.string(from: sender.date)
    }
    
    
    @IBAction func confirmReservation(_ sender: Any) {
        
        guard let partyNameText = partyName.text, !partyNameText.isEmpty else {
            alertMessage()
            return
        }
        guard let partyAmountText = partyAmount.text, !partyAmountText.isEmpty else {
            alertMessage()
            return
        }
        guard let phoneNumberText = phoneNumber.text, !phoneNumberText.isEmpty else {
            alertMessage()
            return
        }
        reservationConfirmedNotification()
        
        let realm = try! Realm()
        
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        
        let reservation = ReservationInformation()
        reservation.name = partyName.text
        reservation.amount = partyAmount.text
        reservation.date = date

        
        try! realm.write{
            realm.add(reservation)
        }
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blurb.text = "*You can reserve a seat for any day of the week*"
    }
    
    //Show alert when a user doesnt enter information in all text fields
    func alertMessage(){
        let alert = UIAlertController(title: "Pollardos", message: "Please Fill In All Of The Text Fields", preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    //in 5 seconds the notification will tell them the order was confirmed
    func reservationConfirmedNotification() {
        
        let content = UNMutableNotificationContent()
        
        content.title = "Reservation Confirmed!"
        content.body = "Thank you for your reservation. See you soon!"
        content.sound = UNNotificationSound.default
        content.badge = NSNumber(value: UIApplication.shared.applicationIconBadgeNumber + 1)
        
        //In 5 seconds they will get the notification
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //Create the request
        let request = UNNotificationRequest(identifier: "notification.timer.\(UUID().uuidString)", content: content, trigger: trigger)
        
        //Add the request
        UNUserNotificationCenter.current().add(request, withCompletionHandler: {
            error in
            if error != nil {
                print("Error with the timer - \(error!.localizedDescription)")
            }
        })
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
