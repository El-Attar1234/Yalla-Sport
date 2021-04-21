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

extension SportsVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.sliderCollectionview {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as! SliderCollectionViewCell
            cell.set(sport: sports[indexPath.item])
            return cell
        }
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportCollectionViewCell", for: indexPath) as! SportCollectionViewCell
        cell.set(sport: sports[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.sliderCollectionview {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
        let      screenWidth = UIScreen.main.bounds.width
        let     screenHeight = UIScreen.main.bounds.height
        let padding :CGFloat = 80
        let availableWidth=screenWidth - padding*2-5
        return CGSize(width: availableWidth/2, height: screenHeight/8)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.sliderCollectionview {
            return 0
        }
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == self.sliderCollectionview {
            return 0
        }
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
}
