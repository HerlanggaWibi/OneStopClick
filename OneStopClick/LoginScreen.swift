//
//  LoginScreen.swift
//  OneStopClick
//
//  Created by herlangga wibi on 14/09/19.
//  Copyright © 2019 herlangga wibi. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userName.beautifulTextField()
        passWord.beautifulTextField()
        signInButton.beautifulButton()
        signUp.beautifulButton()
        //background.beautifulBG()
    }
    

}

extension UITextField {
    func beautifulTextField() {
        self.borderStyle = .none
        self.layer.masksToBounds = false
        //To apply corner radius
        self.layer.cornerRadius = self.frame.size.height / 3
        
        //To apply border radius
        self.layer.borderWidth = 0.25
        self.layer.borderColor = UIColor.lightGray.cgColor
        
        //To apply shadow
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        
        //To apply background
        self.layer.backgroundColor = UIColor.white.cgColor
        
    }
}

extension UIButton {
    func beautifulButton() {
        
        //Adding corner radius
        self.layer.cornerRadius = 7
        
        //Adding shadow 
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}

extension UIImageView {
    func beautifulBG() {
        self.layer.opacity = 10
    }
}
