//
//  Home.swift
//  OneStopClick
//
//  Created by MTMAC18 on 17/09/19.
//  Copyright © 2019 herlangga wibi. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let user = UserDefaults.standard.string(forKey: "email")
        
        label.text = user!
    }
    
    @IBAction func deleteToken (_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "token")
        print("token terhapus: \(String(describing: UserDefaults.standard.string(forKey: "token")))")
        dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
