//
//  HomeViewController.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/8/24.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseFirestore

class HomeViewController: BaseViewController, Storyboarded {
    
    static var storyboard = AppStoryboard.home
    var viewModel: HomeViewModel?
    let db = Firestore.firestore()
    private var tabList: [TabModel] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        self.setUpBindings()
        
    }

    private func configUI() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "PetCell", bundle: nil), forCellWithReuseIdentifier: "PetCell")
    }
    
    private func setUpBindings() {
        //guard let viewModel = viewModel else { return }
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = true
        db.settings = settings
        
        fetchUsers()
    }
    
    func fetchUsers() {
        db.collection("Config/Home/results")
            .order(by: "order", descending: false)
            .getDocuments(source: .cache) { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let name = data["name"] as? String ?? ""
                    let iconName = data["iconName"] as? String ?? ""
                    let pageName = data["pageName"] as? String ?? ""
                    let obj = TabModel(name: name, nameMm: name, iconName: iconName, pageName: pageName)
                    self.tabList.append(obj)
                }
                self.collectionView.reloadData()
            }
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetCell", for: indexPath) as! PetCell
        cell.iconImage.image = UIImage(named: "\(self.tabList[indexPath.row].iconName!)")
        cell.nameLabel.text = self.tabList[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.didSignOut()
    }
}
