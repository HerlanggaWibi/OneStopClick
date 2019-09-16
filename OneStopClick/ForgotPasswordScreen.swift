//
//  ForgotPasswordScreen.swift
//  OneStopClick
//
//  Created by MTMAC18 on 16/09/19.
//  Copyright © 2019 herlangga wibi. All rights reserved.
//

import UIKit

class ForgotPasswordScreen: UIViewController {

    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var submit: UIButton!
    
    @IBOutlet weak var signIn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    
    }
    
    func setupUI() {
        email.beautifulTextField()
        submit.beautifulButton()
        signIn.beautifulButton()
    }
}
