//
//  RegisterScreen.swift
//  OneStopClick
//
//  Created by MTMAC18 on 16/09/19.
//  Copyright © 2019 herlangga wibi. All rights reserved.
//

import UIKit
import Firebase
import SCLAlertView

class RegisterScreen: UIViewController {
    
    
    @IBOutlet weak var fullName: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var signIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupUI()
    }
    
    func setupUI() {
        fullName.beautifulTextField()
        email.beautifulTextField()
        passWord.beautifulTextField()
        signUp.beautifulButton()
        signIn.beautifulButton()
    }
    
    
    @IBAction func signUP(_ sender: UIButton) {
        let emailUser = email.text!
        let passUser = passWord.text!
        let alert = SCLAlertView()
        
        if emailUser != "" && passUser != "" {
            Auth.auth().createUser(withEmail: emailUser, password: passUser) { authResult, error in
                if let error = error {
                    alert.showError(error as! String, subTitle: "d")
                }
                else {
                    
                    //let userName = self.fullName.text
                    
                    
                    //Alert
                    DispatchQueue.main.async {
                        ProgressHUD.showSuccess("Registered", interaction: true)
                    }
                    
                }
                //Go to login page
                self.performSegue(withIdentifier: "Login", sender: self)
            }
            
        }
    }
    
    
    
}
