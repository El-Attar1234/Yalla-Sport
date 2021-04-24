//
//  LastCVC.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/24/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class LastCVC: UICollectionViewCell {
    @IBOutlet weak var homeTeamImage: UIImageView!
    @IBOutlet weak var awayTeamImage: UIImageView!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var awayTeamName: UILabel!
    @IBOutlet weak var timeDateLabe: UILabel!
    @IBOutlet weak var homeTeamBadge: UILabel!
    @IBOutlet weak var awayTeamBadge: UILabel!
    
    func set(for event :Event) {
        homeTeamName.text =  event.strHomeTeam
        awayTeamName.text =  event.strAwayTeam
        homeTeamBadge.text = event.intHomeScore
        awayTeamBadge.text = event.intAwayScore
    }
    
    
    
    
    
    
}
