//
//  LeaguesViewModel.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/27/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation

class LeaguesViewModel :NSObject{
    var remoteDataSource : RemoteDataSourceProtocol!
    
    var allLeagues = [League]()
    
    
    var isLoading : Bool!{
        didSet{
            self.checkIfDataIsLoading(isLoading)
        }
    }
    var isSuccess : Bool!{
        didSet{
            self.checkIfResponseIsSuccess(isSuccess)
        }
    }
    
    
    
    var checkIfDataIsLoading : (Bool)->() = { _ in }
    var checkIfResponseIsSuccess : (Bool)->() = { _ in }
    
    
    
    
    override init() {
        super.init()
        remoteDataSource  = RemoteDataSource()
        
        
    }
    
    
     func downloadAllLeagues(sport :String){
        let remoteDatasource = RemoteDataSource()
        self.isLoading = true
        remoteDatasource.getAllLeagues {[weak self] (result) in
            guard let self = self else{return}
            self.isLoading = false
            switch result {
            case .success(let response):
                guard let leagues = response?.leagues else { return  }
                for league in leagues {
                    if league.strSport! == sport{
                        self.downloadLeagueDataById(leagueId: league.idLeague!)
                    }
                }
                
            case .failure(let error):
                self.isSuccess = false
                /*  print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                 print(error.code)*/
            }
        }
    }
    
    private func downloadLeagueDataById(leagueId:String){
        let remoteDatasource = RemoteDataSource()
        remoteDatasource.getLeagueData(leagueId :leagueId) {[weak self] (result) in
            guard let self = self else{return}
            
            switch result {
            case .success(let response):
                guard let leagues = response?.leagues else { return  }
                self.allLeagues.append(leagues[0])
                self.isSuccess = true
            case .failure(let error):
                /*  print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                 print(error.code)*/
                self.isSuccess = false
            }
        }
    }
    
    
    
    
}
