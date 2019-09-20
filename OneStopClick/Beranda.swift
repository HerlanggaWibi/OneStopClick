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
        deleteToken()
        configNavBar_UI()
        search.delegate = self
    }
    
    func deleteToken() {
        UserDefaults.standard.removeObject(forKey: "token")
        print("token terhapus: \(String(describing: UserDefaults.standard.string(forKey: "token")))")
        
    }
    
    // Declare obj of search bar
    let search = UISearchBar()
    
    // Declare search bar in right bar button
    lazy var searchBar: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearchBar))
        
        return barButtonItem
        
    }()
    
    
    func configNavBar_UI() {
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.rightBarButtonItem = searchBar
        
        
    }
    
    @objc func handleShowSearchBar() {
        print("show textfield")
        navigationItem.titleView = search
        search.showsCancelButton = true
        navigationItem.rightBarButtonItem = nil
        search.becomeFirstResponder()
    }
    
    func searchShow() {
        search.resignFirstResponder()
        navigationItem.titleView = nil
        navigationItem.rightBarButtonItem = searchBar
    }
   

}

extension Beranda: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchShow()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("text did begin editing")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("text end editing")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(search.text)
    }
}
