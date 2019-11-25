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
    
    var badgeCount = 0

    @IBOutlet weak var partyName: UITextField!
    @IBOutlet weak var partyAmount: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var blurb: UILabel!
    
    @IBAction func confirmReservation(_ sender: Any) {
        reservationConfirmedNotification()
        
        let realm = try! Realm()
        
        print(Realm.Configuration.defaultConfiguration.fileURL as Any)
        
        let reservation = Reservation()
        reservation.name = partyName.text
        reservation.amount = partyAmount.text
        reservation.month = monthTextField.text
        reservation.day = dayTextField.text
        reservation.time = timeTextField.text

        
        try! realm.write{
            realm.add(reservation)
        }
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blurb.text = "*You can reserve a seat for any day of the week*"
    }
    
    //in 5 seconds the notification will tell them the order was confirmed
    func reservationConfirmedNotification() {
        
        let content = UNMutableNotificationContent()
        
        content.title = "Reservation Confirmed!"
        content.body = "Thank you for your reservation. See you soon!"
        content.sound = UNNotificationSound.default
        content.badge = NSNumber(value: UIApplication.shared.applicationIconBadgeNumber + 1)
        
        //Create the trigger
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
//func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//        dismiss(animated: true, completion: nil)
//    }




//        let picker = MFMailComposeViewController()
//        picker.mailComposeDelegate = self
//
//        let message = "Hello, im trying to set up a reservation under the \(partyName) party. We would like to reserve a table of \(partyAmount) on \(monthTextField) \(dayTextField) at \(timeTextField). If there are any issues, call \(phoneNumber)"
//
//        picker.setToRecipients(["codypollard11@hotmail.com"])
//        picker.setSubject("Pollardo Order")
//        picker.setMessageBody(message, isHTML: true)
