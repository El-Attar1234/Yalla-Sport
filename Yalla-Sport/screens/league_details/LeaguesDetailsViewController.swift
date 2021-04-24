//
//  LeaguesDetailsViewController.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/23/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class LeaguesDetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
                print("events--> \(events.count)")
            
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                print(error.code)
            }
        }
    }
    
    
    


}
