//
//  LeagueTableViewCell.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/22/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {
    @IBOutlet weak var leagueImage: UIImageView!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var youtubeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func set(league : League){
        leagueName.text = league.strLeague
        //print(league.strFanart1 ?? "no link")
        leagueImage.doenloadImage(url: league.strFanart1 ?? "https://www.thesportsdb.com/images/media/league/fanart/o9c14r1547554186.jpg")
        leagueImage.makeRounded()
    }

}
