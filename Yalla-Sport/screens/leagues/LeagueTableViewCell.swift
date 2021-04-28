//
//  LeagueTableViewCell.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/22/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit
import SafariServices



protocol YoutubeActionDelegate : class{
    func buttonPressed(link : String)
}

class LeagueTableViewCell: UITableViewCell {
    @IBOutlet weak var leagueImage: UIImageView!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var youtubeButton: UIButton!
    
    var youtubeLink : String!
     weak var youtubeDelegat : YoutubeActionDelegate!
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
        if league.strYoutube!.isEmpty {
          youtubeButton.isHidden = true
        }
        else{  youtubeButton.isHidden = false
                      self.youtubeLink  = league.strYoutube!
                      youtubeButton.setImage(UIImage(named: "youtube")!.withRenderingMode(.alwaysOriginal), for: .normal)
                      youtubeButton.layer.cornerRadius = 10
                      let tapGR = UITapGestureRecognizer(target: self, action: #selector(self.youtubeTaped))
                      youtubeButton.addGestureRecognizer(tapGR)
                      youtubeButton.isUserInteractionEnabled = true
            
            
        }
        
        
        
        leagueImage.doenloadImage(url: league.strFanart1 ?? league.strFanart2 ?? league.strFanart3 ?? league.strFanart4 ?? league.strBadge ?? league.strLogo ?? league.strTrophy ??  "")
        leagueImage.makeRounded()
    }
 
       @objc func youtubeTaped(_ sender: UITapGestureRecognizer ) {
        youtubeDelegat.buttonPressed(link: "https://\(youtubeLink!)")
    }
    
    
    
    
    

}
