//
//  RemoteDataSourceWrapper.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/20/21.
//  Copyright © 2021 ITI. All rights reserved.
//

enum RemoteDataSourceWrapper{
    case getAllSports
}

extension RemoteDataSourceWrapper :ApiRequestWrapper{
    var baseURL: String {
        switch self {
        case .getAllSports:
         return "https://www.thesportsdb.com/api/v1/json/1"
        }
       
    }
    
    var endpoint: String {
        switch self {
        case .getAllSports:
         return "/all_sports.php"
        }
    
    }
    
    var method: HttpMethod {
        switch self {
        case .getAllSports:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAllSports:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getAllSports:
         return nil
        }
    }
    
    
}
