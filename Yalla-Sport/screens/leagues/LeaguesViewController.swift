//
//  LeaguesViewController.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/22/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class LeaguesViewController: UIViewController {

    @IBOutlet weak var leagueTableView: UITableView!
    var sport      : String!
    var allLeagues = [League]()
    override func viewDidLoad() {
        super.viewDidLoad()
         downloadAllLeagues()
        downloadLeagueDataById(leagueId : "4328")
        // Do any additional setup after loading the view.
    }
    
    private func downloadAllLeagues(){
        let remoteDatasource = RemoteDataSource()
        //   self.view.showIndicator()
        remoteDatasource.getAllLeagues {[weak self] (result) in
            guard let self = self else{return}
            //     self.view.hideIndicator()
            switch result {
            case .success(let response):
                guard let leagues = response?.leagues else { return  }
                print("Leagues 1--> \(leagues.count)")
                for league in leagues {
                    if league.strSport! == "Soccer"{
                        self.downloadLeagueDataById(leagueId: league.idLeague!)
                        
                    }
                    
                }
                print("Leagues 2--> \(self.allLeagues.count)")
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                print(error.code)
            }
        }
    }

    
    private func downloadLeagueDataById(leagueId:String){
        let remoteDatasource = RemoteDataSource()
        //   self.view.showIndicator()
        remoteDatasource.getLeagueData(leagueId :leagueId) {[weak self] (result) in
            guard let self = self else{return}
            //     self.view.hideIndicator()
            switch result {
            case .success(let response):
                guard let leagues = response?.leagues else { return  }
              self.allLeagues.append(leagues[0])
                DispatchQueue.main.async {
                    self.leagueTableView.reloadData()
                }
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                print(error.code)
            }
        }
    }
    
}
