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
    var upComingEvents=[Event]()
     var teams=[Team]()
    var league:League!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
       downloadAllEvents()
      //  downloadTeamDetailsByName()
      //  downloadUpcomingEvents(leagueId: "4328", round: "34", season: "2020-2021")
    }
    
    private func configure(){
        let button1 = UIBarButtonItem(image: UIImage(systemName: "heart.fill"), style: .plain, target: self, action: #selector(addToFavourites)) 
        self.navigationItem.rightBarButtonItem  = button1
        
        
    }
    
    @objc func addToFavourites(){
        let localData = PersistenceManager.shared
        localData.addToFavourites(favLeague: self.league)
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
                let event = events[0]
                let leagueId=event.idLeague!
                let round=Int(event.intRound!)!
                self.downloadUpcomingEvents(leagueId: leagueId, round: "\(round+1)", season: event.strSeason!)
                self.downloadAllTeams(leagueName: event.strLeague!)
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
    private func downloadUpcomingEvents(leagueId : String , round :String ,season : String){
           let remoteDatasource = RemoteDataSource()
           //   self.view.showIndicator()
        remoteDatasource.getUpcomingEvents(leagueId: leagueId, round: round, season: season){[weak self] (result) in
               guard let self = self else{return}
               //     self.view.hideIndicator()
               switch result {
               case .success(let response):
                   guard let events = response?.events else { return  }
                 
                   DispatchQueue.main.async {
                self.upComingEvents=events
                self.mainTableView.reloadData()
                   }
                   
                   
                   
               case .failure(let error):
                   print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                   print(error.code)
               }
           }
       }
    private func downloadAllTeams(leagueName :String){
           let remoteDatasource = RemoteDataSource()
           //   self.view.showIndicator()
        remoteDatasource.getAllTeamsInLeague(leagueName: leagueName){[weak self] (result) in
               guard let self = self else{return}
               //     self.view.hideIndicator()
               switch result {
               case .success(let response):
                   guard let teams = response?.teams else { return  }
                   print("\(teams)")
                   DispatchQueue.main.async {
                    self.teams=teams
                    self.mainTableView.reloadData()
                }
                   
               case .failure(let error):
                   print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                   print(error.code)
               }
           }
       }
    
    
}
