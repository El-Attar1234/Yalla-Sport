//
//  EventResponse.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/23/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation

class EventResponse<T : Codable>: Codable {
    var events:[T]?
    enum CodingKeys : String , CodingKey{
        case events = "events"
        
    }
}
