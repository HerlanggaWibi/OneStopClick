//
//  Beranda.swift
//  OneStopClick
//
//  Created by MTMAC18 on 19/09/19.
//  Copyright © 2019 herlangga wibi. All rights reserved.
//

import UIKit

class Beranda: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configNavBar_UI()
        
    }
    
    // Declare search bar in right bar button
//    lazy var searchBar: UIBarButtonItem = {
//        let barButtonItem =
//        
//        return barButtonItem
//        
//    }()
    
    
    func configNavBar_UI() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "search", style: .plain, target: self, action: #selector(search))
        
        
    }
    
    @objc func search() {
        print("show textfield")
    }
   

}
