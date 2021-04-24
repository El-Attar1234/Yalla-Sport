//
//  LeaguesDetailsViewController.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/23/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class LeaguesDetailsViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    var pastEventsArray=[Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         print("gggg")
        downloadAllEvents()
    }
    
    private func downloadAllEvents(){
        let remoteDatasource = RemoteDataSource()
        //   self.view.showIndicator()
        remoteDatasource.getAllEvents(leagueId :"4328"){[weak self] (result) in
            guard let self = self else{return}
            //     self.view.hideIndicator()
            switch result {
            case .success(let response):
                guard let events = response?.events else { return  }
               print("gggg")
                               print("count->>>\(events[10])")
                DispatchQueue.main.async {
                 
                 self.pastEventsArray=events
                   self.mainTableView.reloadData()
                }
                
                
                
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                print(error.code)
            }
        }
    }
    
    private func downloadAllTeams(){
           let remoteDatasource = RemoteDataSource()
           //   self.view.showIndicator()
           remoteDatasource.getAllEvents(leagueId :"4328"){[weak self] (result) in
               guard let self = self else{return}
               //     self.view.hideIndicator()
               switch result {
               case .success(let response):
                   guard let events = response?.events else { return  }
                  print("gggg")
                                  print("count->>>\(events[10])")
                   DispatchQueue.main.async {
                    
                    self.pastEventsArray=events
                      self.mainTableView.reloadData()
                   }
                   
                   
                   
               case .failure(let error):
                   print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                   print(error.code)
               }
           }
       }
    
    
    
}
