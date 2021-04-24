//
//  LastTVC.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/24/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class LastTVC: UITableViewCell {

    @IBOutlet weak var lastCollectionView: UICollectionView!
    var pastEvents=[Event]()
    override func awakeFromNib() {
        super.awakeFromNib()
       lastCollectionView.delegate=self
        lastCollectionView.dataSource=self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(for events :[Event]) {
        self.pastEvents=events
        lastCollectionView.reloadData()
    }
    

}
