//
//  AnimateLaunchViewController.swift
//  Pollardos
//
//  Created by Sabrina Gaspar on 2019-11-07.
//  Copyright © 2019 Cody Pollard. All rights reserved.
//

import UIKit

class AnimateLaunchViewController: UIViewController {

    @IBOutlet weak var logo: UIImageView!
    let frame = CGRect(x: 80, y: 340, width: 240, height: 128)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBigger()

        let timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(moveToHome), userInfo: nil, repeats: false)
        
    }
    func makeBigger(){
        UIView.animate(withDuration: 2.5) {
            self.logo.frame = CGRect(x: 80, y: 340, width: 260, height: 148)
        }
        
    }
    @objc func moveToHome(){
        self.performSegue(withIdentifier: "moveToHome", sender: self)
    }
    
    
    func makeSmaller(){
        UIView.animate(withDuration: 2.5) {
            self.logo.frame = CGRect(x: 67, y: 269, width: 240, height: 128)
        }
    }
}
