//
//  TeamResponse.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/24/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation

class TeamResponse<T : Codable>: Codable {
    var teams:[T]?
    enum CodingKeys : String , CodingKey{
        case teams = "teams"
        
    }
}
