//
//  UpcomingTVC.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/24/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class UpcomingTVC: UITableViewCell {
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        upcomingCollectionView.delegate=self
        upcomingCollectionView.dataSource=self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
