//
//  HomeViewController.swift
//  PetClinic
//
//  Created by Thant Han Linn on 2/8/24.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController, Storyboarded {
    
    static var storyboard = AppStoryboard.home
    var viewModel: HomeViewModel?
    private var tabList: [TabModel] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        self.setUpBindings()
        print(UserManager.shared.getUserId())
    }

    private func configUI() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "PetCell", bundle: nil), forCellWithReuseIdentifier: "PetCell")
    }
    
    private func setUpBindings() {
        //guard let viewModel = viewModel else { return }
        fetchUsers()
    }
    
    func fetchUsers() {
        self.tabList = []
        viewModel?.fetchConfig { result in
            switch result {
            case .success(let data):
                self.tabList = data
                self.collectionView.reloadData()
            case .failure(let error):
                print("error")
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
        if indexPath.row == 1 {
            viewModel?.didMyPetRedirectAction()
        }
        if indexPath.row == 4 {
            viewModel?.didSignOut()
        }
        
    }
}
