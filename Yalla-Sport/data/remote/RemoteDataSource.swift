//
//  RemoteDataSource.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/20/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation
protocol RemoteDataSourceProtocol {
    func getAllSports(completion: @escaping (Result<SportsResponse<Sport>?, NSError>) -> Void)
    func getAllLeagues(completion: @escaping (Result<LeagueResponse<League>?, NSError>) -> Void)
    func getLeagueData(leagueId:String , completion: @escaping (Result<LeagueResponse<League>?, NSError>) -> Void)
}


class RemoteDataSource: NetworkManager<RemoteDataSourceWrapper> , RemoteDataSourceProtocol {
    func getLeagueData(leagueId: String, completion: @escaping (Result<LeagueResponse<League>?, NSError>) -> Void) {
        self.fetchData(target: .getLeagueData(leagueId: leagueId), responseClass:LeagueResponse<League>.self) { (result) in
                     completion(result)
                 }
    }
    
    func getAllLeagues(completion: @escaping (Result<LeagueResponse<League>?, NSError>) -> Void) {
             self.fetchData(target: .getAllLeagues, responseClass:LeagueResponse<League>.self) { (result) in
                     completion(result)
                 }
    }
    
   
 
    
    func getAllSports(completion:  @escaping (Result<SportsResponse<Sport>?, NSError>) -> Void) {
        self.fetchData(target: .getAllSports, responseClass:SportsResponse<Sport>.self) { (result) in
                  completion(result)
              }
    }
    
   
}
