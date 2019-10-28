//
//  ReservationViewController.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-10-24.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import UIKit
import MessageUI

class ReservationViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var partyName: UITextField!
    @IBOutlet weak var partyAmount: UITextField!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var dayTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func confirmReservation(_ sender: Any) {
        let picker = MFMailComposeViewController()
        picker.mailComposeDelegate = self
        
        let message = "Hello, im trying to set up a reservation under the \(partyName) party. We would like to reserve a table of \(partyAmount) on \(monthTextField) \(dayTextField) at \(timeTextField). If there are any issues, call \(phoneNumber)"
        
        picker.setToRecipients(["codypollard11@hotmail.com"])
        picker.setSubject("Pollardo Order")
        picker.setMessageBody(message, isHTML: true)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }

}
