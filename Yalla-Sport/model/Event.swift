//
//  Event.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/23/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation
struct Event: Codable {
    var strLeague :String?
    var idEvent: String?
    var idAPIfootball: String?
    var strEvent: String?
    var strEventAlternate: String?
    var strFilename: String?
    var dateEvent: String?
    var dateEventLocal: String?
    var idAwayTeam: String?
    var strAwayTeam: String?
    var idHomeTeam: String?
     var strHomeTeam: String?
      var strSeason: String?
    var idLeague: String?
    var intAwayScore: String?
    var strBanner: String?
    var strCity: String?
    var intAwayShots: Int?
    var intHomeScore: String?
    var intHomeShots: Int?
    var strAwayGoalDetails: String?
    var strAwayLineupDefense: String?
    var strAwayLineupForward: String?
    var strAwayLineupGoalkeeper: String?
    var strAwayLineupMidfield: String?
    var strAwayLineupSubstitutes: String?
    var strAwayRedCards: String?
    var intRound: String?
    var intSpectators: Int?
    var strAwayFormation: String?
    var strAwayYellowCards: String?
    var strCountry: String?
    var strDescriptionEN: String?
    var strFanart: String?
    var strThumb: String?
}
