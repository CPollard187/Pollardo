//
//  PersonalViewController.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-10-24.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import UIKit
import MessageUI
import UserNotifications

class PersonalViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate {

    var accessGranted = false
    var badgeCount = 0
    
    //MARK: OUTLETS
    @IBOutlet weak var fNameTextField: UITextField!
    @IBOutlet weak var lNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var blurb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        let fNameText = fNameTextField.text
//        let lNameText = lNameTextField.text
//        let phoneNumber = phoneNumberTextField.text
        
        fNameTextField.delegate = self
        lNameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
        
        blurb.text = "*Orders take about 45 minutes*"

    }
    
    //in 5 seconds the notification will tell them the order was confirmed
    func orderConfirmedNotification() {
        
        let content = UNMutableNotificationContent()
        
        content.title = "Order Confirmed!"
        content.body = "Your order will be ready in 45 minutes"
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
    
    //In 45 minutes, the notification will tell them the order is ready for pickup
    func orderReadyNotification() {
        
        let content = UNMutableNotificationContent()
        
        content.title = "Order Ready"
        content.body = "Your order is ready for pick up!"
        content.sound = UNNotificationSound.default
        content.badge = NSNumber(value: UIApplication.shared.applicationIconBadgeNumber + 1)
        
        //Create the trigger
        //In 45 minutes they will get the notification
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2700, repeats: false)
        
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
    
    
    //When they hit confirm order it will send them a notfication for the order being confirmed and the order being ready for pickup
    @IBAction func confirmOrder(_ sender: Any) {
        orderConfirmedNotification()
        orderReadyNotification()

        }
}
        //Email
//        let picker = MFMailComposeViewController()
//        picker.mailComposeDelegate = self
//
//        let message = "Hello my name is \(fNameTextField) \(lNameTextField). I just ordered from the Pollardo app. Please contact me at \(phoneNumberTextField) if there are any problems."
//
//        picker.setToRecipients(["codypollard11@hotmail.com"])
//        picker.setSubject("Pollardo Order")
//        picker.setMessageBody(message, isHTML: true)
        


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //When they send the email it will close and go back to the confirm cart screen
//    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//        dismiss(animated: true, completion: nil)
//    }


