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
  
}

extension UIView{
    func makeRounded() {
             self.layer.borderWidth = 1
             self.layer.masksToBounds = false
             self.layer.borderColor = UIColor.black.cgColor
             self.layer.cornerRadius = self.frame.height / 2
             self.clipsToBounds = true
         }
    
   
}
extension UITableViewCell{
    func makeCellRounded(){
        contentView.layer.cornerRadius = 10
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true

     layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0.5)
       layer.shadowRadius = 6.0
        layer.shadowOpacity = 0.3
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
        layer.backgroundColor = UIColor.clear.cgColor
    }
}
