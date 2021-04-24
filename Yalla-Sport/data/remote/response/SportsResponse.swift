//
//  SportsResponse.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/20/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation
class SportsResponse<T : Codable>: Codable {
    var sports:[T]?
    enum CodingKeys : String , CodingKey{
        case sports = "sports"
        
    }
}
