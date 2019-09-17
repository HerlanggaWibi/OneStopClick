//
//  LoginScreen.swift
//  OneStopClick
//
//  Created by herlangga wibi on 14/09/19.
//  Copyright © 2019 herlangga wibi. All rights reserved.
//

import UIKit
import Firebase
import SCLAlertView
import GoogleSignIn
import FBSDKCoreKit
import FacebookLogin

class LoginScreen: UIViewController, LoginButtonDelegate {
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                // ...
                return
            }
            // User is signed in
            // ...
            let result1 = authResult?.user.displayName
            let result2 = authResult?.user.email
            let result3 = authResult?.user.uid
            
            print("result1: \(String(describing: result1))")
            print("result2: \(String(describing: result2))")
            print("result3: \(String(describing: result3))")
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
    

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var background: UIImageView!
    
    @IBOutlet weak var googleSignButton: GIDSignInButton!
    
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        
        //FB
        let loginButton = FBLoginButton(permissions: [ .publicProfile ])
        loginButton.delegate = self
        
    }
    
    func setupUI() {
        email.beautifulTextField()
        passWord.beautifulTextField()
        signInButton.beautifulButton()
        signUp.beautifulButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard let token = userDefault.string(forKey: "token") else {return}
        if token != "" {
            print("Langsung home screen")
            print("token: \(token)")
            self.performSegue(withIdentifier: "Home", sender: self)
        }
    }
    
    
    @IBAction func signIN(_ sender: UIButton) {
        let emailuser = email.text!
        let password = passWord.text!
        
        if emailuser != "" && password != "" {
            Auth.auth().signIn(withEmail: emailuser, password: password) { (result, error) in
                if let error = error {
                    print(error)
                    ProgressHUD.showError("Gagal Login", interaction: true)
                }
                else {
                    
                    let email = result?.user.email
                    let token = result?.user.uid
                    
                    let userDefault = UserDefaults.standard
                    
                    userDefault.set(email, forKey: "email")
                    userDefault.set(token, forKey: "token")
                    
                    DispatchQueue.main.async {
                    ProgressHUD.showSuccess()
                    self.performSegue(withIdentifier: "Home", sender: self)
                    }
                    }

                    }
                }
            }
        }
        
    
extension LoginScreen: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        let emailGet = user.profile.email
        let userID = user.userID
        let name = user.profile.name
        
        userDefault.set(emailGet, forKey: "email")
        userDefault.set(userID, forKey: "token")
        userDefault.set(name, forKey: "name")
        
        self.performSegue(withIdentifier: "Home", sender: self)
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
