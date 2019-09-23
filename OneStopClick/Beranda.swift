//
//  Beranda.swift
//  OneStopClick
//
//  Created by MTMAC18 on 19/09/19.
//  Copyright © 2019 herlangga wibi. All rights reserved.
//

import UIKit

class Beranda: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let images2 = ["kemeja1.jpg", "kemeja2.jpg", "kemeja3.jpg", "kemeja4.jpg", "kemeja5.jpg", "kemeja6.jpg", "kemeja7.jpg", "kemeja8.jpg"]
    
    let images = [#imageLiteral(resourceName: "kemeja7"), #imageLiteral(resourceName: "kemeja8"), #imageLiteral(resourceName: "kemeja6"), #imageLiteral(resourceName: "kemeja1"), #imageLiteral(resourceName: "kemeja3"), #imageLiteral(resourceName: "kemeja5"), #imageLiteral(resourceName: "kemeja2"), #imageLiteral(resourceName: "kemeja4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deleteToken()
        configNavBar_UI()
        search.delegate = self
        
        if let layout = collectionView.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        
        // untuk batas setiap item
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
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

extension Beranda: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BerandaCell
        
        let image = images[indexPath.item]
        cell.imageProduct.image = image
        
        return cell
    }
    
}

extension Beranda:  PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let image = images[indexPath.item]
        let height = image.size.height
        
        return height
    }
    
    
}


// Flow Layout delegate
//extension Beranda: UICollectionViewDelegateFlowLayout {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let width = collectionView.frame.size.width
//        let numberOfColumn: CGFloat = 2
//        let cellSpacing: CGFloat = 5
//        let xInset: CGFloat = 10
//
//        return CGSize(width: (width / numberOfColumn) - (xInset + cellSpacing), height: (width / numberOfColumn) - (xInset + cellSpacing))
//    }

// }
