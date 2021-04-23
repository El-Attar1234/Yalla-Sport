//
//  SportsVC.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/20/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class SportsVC: UIViewController {
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var sliderCollectionview: UICollectionView!
    var sports = [Sport]()
    var timer :Timer!
    var currentIndex=0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadSports()
        startTimer()
    }
    private func downloadSports(){
        let remoteDatasource = RemoteDataSource()
        //   self.view.showIndicator()
        remoteDatasource.getAllSports {[weak self] (result) in
            guard let self = self else{return}
            //     self.view.hideIndicator()
            switch result {
            case .success(let response):
                guard let sports = response?.sports else { return  }
                self.sports=sports
                DispatchQueue.main.async {
                    self.sportsCollectionView.reloadData()
                    self.sliderCollectionview.reloadData()
                    self.pageController.numberOfPages=self.sports.count
                }
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                print(error.code)
            }
        }
    }
    private func startTimer(){
        timer=Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(scrollToNext), userInfo: nil, repeats: true)
    }
    @objc  func scrollToNext(){
        if currentIndex < sports.count-1{currentIndex += 1}
        else{currentIndex=0}
        sliderCollectionview.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageController.currentPage=currentIndex
    }
    
  
    
}


