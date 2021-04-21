//
//  SliderCollectionViewCell.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/20/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var sliderImage: UIImageView!
    func set(sport:Sport){
        sliderImage.doenloadImage(url: sport.strSportThumb!)
    }
}
