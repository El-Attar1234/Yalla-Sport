//
//  SportsVC.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/20/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit
import SwiftMessages

class SportsVC: UIViewController {
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var sliderCollectionview: UICollectionView!
    var sports = [Sport]()
    var timer :Timer!
    var currentIndex=0
    
    override func viewWillAppear(_ animated: Bool) {
         navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
         var isOnline = ConnectivityManager.shared.isOnline()
                     self.displayMessage( isOnline : isOnline)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadSports()
        startTimer()
    }
    
    func displayMessage(isOnline: Bool) {
         
         let myView = MessageView.viewFromNib(layout: MessageView.Layout.messageView)
         if isOnline == false {
             myView.configureTheme(.error)
             myView.bodyLabel?.text = "No Internet Connection"
         } else {
             myView.configureTheme(.success)
             myView.bodyLabel?.text = "You are connected"
         }
         
         myView.iconImageView?.isHidden = true
         myView.iconLabel?.isHidden = true
         myView.titleLabel?.isHidden = true
         myView.titleLabel?.textColor = UIColor.white
         myView.bodyLabel?.textColor = UIColor.white
         myView.button?.isHidden = true
         
         var myConfig = SwiftMessages.Config()
         myConfig.presentationStyle = .top
         SwiftMessages.show(config: myConfig, view: myView)
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


