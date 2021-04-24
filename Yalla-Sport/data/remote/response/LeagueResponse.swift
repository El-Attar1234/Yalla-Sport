//
//  LeagueResponse.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/22/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation
class LeagueResponse<T : Codable>: Codable {
    var leagues:[T]?
    enum CodingKeys : String , CodingKey{
        case leagues = "leagues"
        
    }
}
