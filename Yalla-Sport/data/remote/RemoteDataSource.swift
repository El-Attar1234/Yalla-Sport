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
    func getAllEvents(leagueId:String , completion: @escaping (Result<EventResponse<Event>?, NSError>) -> Void)
    func getUpcomingEvents(leagueId:String ,round : String ,season : String, completion: @escaping (Result<EventResponse<Event>?, NSError>) -> Void)
    func getTeamDetailsByName(teamName:String , completion: @escaping (Result<TeamResponse<Team>?, NSError>) -> Void)
      func getAllTeamsInLeague(leagueName : String , completion: @escaping (Result<TeamResponse<Team>?, NSError>) -> Void)
    
}


class RemoteDataSource: NetworkManager<RemoteDataSourceWrapper> , RemoteDataSourceProtocol {
    func getAllTeamsInLeague(leagueName: String, completion: @escaping (Result<TeamResponse<Team>?, NSError>) -> Void) {
        self.fetchData(target: .getAllTeamsInLeague(leagueName: leagueName), responseClass:TeamResponse<Team>.self) { (result) in
                   completion(result)
               }
    }
    
    func getUpcomingEvents(leagueId: String, round: String, season: String, completion: @escaping (Result<EventResponse<Event>?, NSError>) -> Void) {
        self.fetchData(target: .getUpcomingEvents(leagueId: leagueId, round: round, season: season), responseClass:EventResponse<Event>.self) { (result) in
                  completion(result)
              }
    }
    
    func getTeamDetailsByName(teamName: String, completion: @escaping (Result<TeamResponse<Team>?, NSError>) -> Void) {
        self.fetchData(target: .getTeamDetailsByName(teamName: teamName), responseClass:TeamResponse<Team>.self) { (result) in
            completion(result)
        }
    }
    
    func getAllEvents(leagueId: String, completion: @escaping (Result<EventResponse<Event>?, NSError>) -> Void) {
        self.fetchData(target: .getAllEvents(leagueId: leagueId), responseClass:EventResponse<Event>.self) { (result) in
            completion(result)
        }
    }
    
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
