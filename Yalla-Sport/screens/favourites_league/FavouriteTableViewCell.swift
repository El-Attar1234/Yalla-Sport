//
//  FavouriteTableViewCell.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/25/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var leagueImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(for league : League){
        leagueName.text = league.strLeague
        leagueImage.makeRounded()
        //leagueImage.doenloadImage(url: league.str)
    }
    
    
    @IBAction func youTubeAction(_ sender: Any) {
    }
    
}
