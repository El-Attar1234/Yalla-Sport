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
    
    //refactor
    //  var isOnline:Bool!
    var sports = [Sport]()
    var timer :Timer!
    var currentIndex=0
    var viewModel = SportsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        addConnectivityObserver()
    }
    fileprivate func addConnectivityObserver(){
        viewModel.checkIfUserisOnline = { [weak self] isOnline in
            guard let self = self else {return}
            self.showConnectivityMessage(isOnline: isOnline)
            if isOnline {
                self.loadData()
            }
            else{
                //no internet
                  self.addConnectionlessImage()
            }
        }
        viewModel.checkConnection()
        
    }
    
    fileprivate func loadData(){
        viewModel.checkIfDataIsLoading = { isLoading in
            if isLoading {self.showLoadingIndicator()}
            else{ self.hideLoadingIndicator()}
        }
        viewModel.checkIfResponseIsSuccess = { isSuccess in
            if isSuccess {
                //       updateTableView
                self.sports = self.viewModel.sports
                
                DispatchQueue.main.async {
                    self.sportsCollectionView.reloadData()
                    self.sliderCollectionview.reloadData()
                    self.pageController.numberOfPages=self.sports.count
                    self.startTimer()
                }
            }
            else{
                //internet error
                
                self.addConnectionlessImage()
            }
        }
        
        viewModel.downloadSports()
        
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


