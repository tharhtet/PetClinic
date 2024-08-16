//
//  WelcomeViewController.swift
//  CarsDB
//
//  Created by Mg Thar Yar on 11/16/23.
//

import UIKit

class WelcomeViewController: BaseViewController, Storyboarded {
    // outlet control
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    static var storyboard = AppStoryboard.welcome
    var viewModel: WelcomeViewModel?
    
    var currentPage: Int = 0
    var slides: [SlideModel] = [
        SlideModel(title: "Cars around you", desc: "5,000 cars to use from a few hours to a few days", image: "Animation1"),
        SlideModel(title: "Live Ride Tracking", desc: "Know your driver in advance and be able to view current location in real time on the map.", image: "Animation2"),
        SlideModel(title: "Ready to go", desc: "If it's a CarLite, you can unlock it with your phone. Easy-peasy.", image: "Animation3")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configUI()
        self.setUpBindings()
    }
    
    private func configUI() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "OnboardingCell", bundle: nil), forCellWithReuseIdentifier: "OnboardingCell")
        
        self.nextButton.layer.cornerRadius = 12
    }
    
    private func setUpBindings() {
        //guard let viewModel = viewModel else { return }
        self.pageControl.numberOfPages = self.slides.count
    }
    
    func scrollToCollectionView(page: Int) {
        nextButton.setTitle(page == self.slides.count - 1 ? "See cars around me" : "Next", for: .normal)
        self.pageControl.currentPage = page
        let indexPath = IndexPath(row: page, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    /// Actions: click events
    @IBAction func pageControlChangeValue(_ pageControl: UIPageControl) {
        self.scrollToCollectionView(page: pageControl.currentPage)
    }
    
    @IBAction func nextAction(_ sender: Any) {
        if currentPage == slides.count - 1 {
            guard let viewModel = viewModel else { return }
            viewModel.skipOnboarding()
        } else {
            currentPage += 1
            self.scrollToCollectionView(page: currentPage)
        }
    }
    
    @IBAction func skipAction(_ sender: Any) {
        guard let viewModel = viewModel else { return }
        viewModel.skipOnboarding()
    }
    
}

extension WelcomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCell
        cell.configure(with: self.slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
        nextButton.setTitle(currentPage == self.slides.count - 1 ? "See cars around me" : "Next", for: .normal)
    }
}

