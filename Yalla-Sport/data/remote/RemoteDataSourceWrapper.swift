//
//  RemoteDataSourceWrapper.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/20/21.
//  Copyright © 2021 ITI. All rights reserved.
import Foundation
import Alamofire

enum RemoteDataSourceWrapper{
    case getAllSports
    case getAllLeagues
    case getLeagueData(leagueId : String)
    case getAllEvents(leagueId : String)
    case getTeamDetailsByName(teamName : String)
}

extension RemoteDataSourceWrapper :ApiRequestWrapper{
    var baseURL: String {
        return "https://www.thesportsdb.com/api/v1/json/1"
    }
    
    var endpoint: String {
        switch self {
        case .getAllSports:
            return "/all_sports.php"
        case .getAllLeagues:
            return "/all_leagues.php"
        case .getLeagueData:
            return "/lookupleague.php"
        case .getAllEvents :
            return "/eventspastleague.php"
        case .getTeamDetailsByName :
            return "/searchteams.php"
        }
        
    }
    
    var method: HttpMethod {
        return .get
    }
    
    var task: Task {
        switch self {
        case .getLeagueData(leagueId: let leagueId) , .getAllEvents(leagueId: let leagueId):
            return .requestParameters(parameters: ["id" : leagueId], encoding: URLEncoding.queryString)
        case .getTeamDetailsByName(teamName: let teamName) :
            return .requestParameters(parameters: ["t" : teamName], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
        
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
