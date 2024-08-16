//
//  PetProfileViewController.swift
//  PetClinic
//
//  Created by Thant Han Linn on 3/6/24.
//

import Foundation
import UIKit

class PetProfileViewController: BaseViewController, Storyboarded {
    static var storyboard: AppStoryboard = .mypets
    var viewModel: PetProfileViewModel?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet private weak var imageHeader: MyPetHeaderStretchableView!
    
    
    private var startContentOffset = CGPoint(x: 0.0, y: 0.0)
    private var startProgress = CGFloat(0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Hello world"

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.parallaxHeader.view = imageHeader
        scrollView.parallaxHeader.mode = .fill
        //scrollView.parallaxHeader.height = getParallaxHeaderHeight()
        scrollView.parallaxHeader.height = 315.0 //320.0
        scrollView.parallaxHeader.delegate = self
        
        let topBarHeight = UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        scrollView.parallaxHeader.minimumHeight = 66
        startContentOffset = scrollView.contentOffset
        startProgress = scrollView.parallaxHeader.progress
    }
    
}

extension PetProfileViewController: MXParallaxHeaderDelegate {
    func parallaxHeaderDidScroll(_ parallaxHeader: MXParallaxHeader) {
        
    }
}


class MyPetHeaderStretchableView: UIView {
    
    @IBOutlet weak var profileView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileView.layer.cornerRadius = profileView.frame.width / 2
    }
}
