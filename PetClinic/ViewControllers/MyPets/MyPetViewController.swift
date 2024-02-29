//
//  MyPetViewController.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/11/24.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseFirestore

class MyPetViewController: BaseViewController, Storyboarded {
    
    static var storyboard = AppStoryboard.mypets
    var viewModel: MyPetViewModel?
    let db = Firestore.firestore()
    private var tabList: [TabModel] = []
    
    @IBOutlet weak var myPetsLabel: UILabel!
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
        self.collectionView.register(UINib(nibName: "MyPetCell", bundle: nil), forCellWithReuseIdentifier: "MyPetCell")
    }
    
    private func setUpBindings() {
        //guard let viewModel = viewModel else { return }
        let settings = FirestoreSettings()
        settings.isPersistenceEnabled = true
        db.settings = settings
        
        fetchUsers()
    }
    
    func fetchUsers() {
        self.tabList = []
        db.collection("/MyPets/NLM0YB2EOiTc7iSmkd7sRX5NRTi2/Pets")
            .getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                let obj1 = TabModel(name: "Add Pets", nameMm: "Add Pets", iconName: "plus-icon", pageName: "")
                self.tabList.append(obj1)
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let name = data["name"] as? String ?? ""
                    let obj = TabModel(name: name, nameMm: name, iconName: "image1", pageName: "")
                    self.tabList.append(obj)
                }
                self.collectionView.reloadData()
            }
        }
    }
}

extension MyPetViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetCell", for: indexPath) as! PetCell
        cell.nameLabel.text = self.tabList[indexPath.row].name
        cell.iconImage.image = UIImage(named: self.tabList[indexPath.row].iconName ?? "")
        if indexPath.row != 0 {
            cell.iconImage.contentMode = .scaleAspectFill
            cell.iconImage.layer.cornerRadius = cell.iconImage.frame.width / 2
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            viewModel?.didAddPetScreen()
        }
    }
}
