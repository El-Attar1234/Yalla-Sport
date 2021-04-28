//
//  SportCollectionViewCell.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/20/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit
import SDWebImage

class SportCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var sportName: UILabel!
    @IBOutlet weak var sportImage: UIImageView!
    
    func set(sport:Sport){
        sportName.text = sport.strSport ?? "no name"
        sportImage.doenloadImage(url: sport.strSportThumb!)
    }
}

extension UIImageView{
   func doenloadImage(url:String){
        self.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "no-image"))
    }
    func makeRounded() {

           self.layer.borderWidth = 1
           self.layer.masksToBounds = false
           self.layer.borderColor = UIColor.black.cgColor
           self.layer.cornerRadius = self.frame.height / 2
           self.clipsToBounds = true
       }
}
