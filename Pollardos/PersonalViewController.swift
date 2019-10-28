//
//  PersonalViewController.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-10-24.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import UIKit
import MessageUI

class PersonalViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate, UITextViewDelegate {

    //MARK: OUTLETS
    @IBOutlet weak var fNameTextField: UITextField!
    @IBOutlet weak var lNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        fNameTextField.delegate = self
        lNameTextField.delegate = self
        emailTextField.delegate = self
        phoneNumberTextField.delegate = self
        
        let fNameText: String? = fNameTextField.text
        let lNameText = lNameTextField.text
        let phoneNumber = phoneNumberTextField.text
        
        
    }
    
    
    //When they hit confirm order it will prompt them to send the email.
    //****MAYBE PROMPT THEM WITH AN ALERT??????****
    @IBAction func confirmOrder(_ sender: Any) {
        
        let picker = MFMailComposeViewController()
        picker.mailComposeDelegate = self
        
        let message = "Hello my name is \(fNameTextField) \(lNameTextField). I just ordered from the Pollardo app. Please contact me at \(phoneNumberTextField) if there are any problems."
        
        picker.setToRecipients(["codypollard11@hotmail.com"])
        picker.setSubject("Pollardo Order")
        picker.setMessageBody(message, isHTML: true)
        
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //When they send the email it will close and go back to the confirm cart screen
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }

}
