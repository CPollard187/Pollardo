//
//  AnimateLaunchViewController.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-11-07.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import UIKit

class AnimateLaunchViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var logo: UIImageView!
    
    //MARK: Properties
    let frame = CGRect(x: 80, y: 340, width: 240, height: 128)
    
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBigger()

        _ = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(moveToHome), userInfo: nil, repeats: false)
        
    }
    //Makes the image bigger
    func makeBigger(){
        UIView.animate(withDuration: 2.5) {
            self.logo.frame = CGRect(x: 80, y: 340, width: 260, height: 148)
        }
        
    }
    //Moves the image to the original position
    @objc func moveToHome(){
        self.performSegue(withIdentifier: "moveToHome", sender: self)
    }
    
    
    func makeSmaller(){
        UIView.animate(withDuration: 2.5) {
            self.logo.frame = CGRect(x: 67, y: 269, width: 240, height: 128)
        }
    }
}
