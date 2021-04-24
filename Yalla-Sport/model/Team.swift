//
//  Team.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/23/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation
struct Team : Codable {

        let idAPIfootball : String
        let idLeague : String
        let idLeague2 : String
        let idLeague3 : String
        let idLeague4 : String
        let idLeague5 : String
        let idLeague6 : String
        let idLeague7 : String
        let idSoccerXML : String
        let idTeam : String
        let intFormedYear : String
        let intLoved : String
        let strAlternate : String?
        let strCountry : String?
        let strDivision : String?
        let strGender : String?
        let strKeywords : String?
        let strLeague : String?
        let strLeague2 : String
        let strLeague3 : String
        let strLeague4 : String
        let strLeague5 : String
        let strLeague6 : String
        let strLeague7 : String
        let strLocked : String
        let strManager : String?
        let strRSS : String?
        let strSport : String?
        let strStadium : String?
        let strStadiumThumb : String?
        let strTeam : String
        let strTeamBadge : String
        let strTeamLogo : String
        let strTeamShort : String
        let strYoutube : String

        enum CodingKeys: String, CodingKey {
                case idAPIfootball = "idAPIfootball"
                case idLeague = "idLeague"
                case idLeague2 = "idLeague2"
                case idLeague3 = "idLeague3"
                case idLeague4 = "idLeague4"
                case idLeague5 = "idLeague5"
                case idLeague6 = "idLeague6"
                case idLeague7 = "idLeague7"
                case idSoccerXML = "idSoccerXML"
                case idTeam = "idTeam"
                case intFormedYear = "intFormedYear"
                case intLoved = "intLoved"
                case strAlternate = "strAlternate"
                case strCountry = "strCountry"
                case strDivision = "strDivision"
                case strGender = "strGender"
                case strKeywords = "strKeywords"
                case strLeague = "strLeague"
                case strLeague2 = "strLeague2"
                case strLeague3 = "strLeague3"
                case strLeague4 = "strLeague4"
                case strLeague5 = "strLeague5"
                case strLeague6 = "strLeague6"
                case strLeague7 = "strLeague7"
                case strLocked = "strLocked"
                case strManager = "strManager"
                case strRSS = "strRSS"
                case strSport = "strSport"
                case strStadium = "strStadium"
                case strStadiumThumb = "strStadiumThumb"
                case strTeam = "strTeam"
                case strTeamBadge = "strTeamBadge"
                case strTeamLogo = "strTeamLogo"
                case strTeamShort = "strTeamShort"
                case strYoutube = "strYoutube"
        }
    
}
