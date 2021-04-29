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
     var upComingEvents=[Event]()
    override func awakeFromNib() {
        super.awakeFromNib()
        upcomingCollectionView.delegate=self
        upcomingCollectionView.dataSource=self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(for events :[Event]) {
           self.upComingEvents=events
           upcomingCollectionView.reloadData()
       }

}
extension UpcomingTVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upComingEvents.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpcomingCVC", for: indexPath) as! UpcomingCVC
               cell.set(for : upComingEvents[indexPath.item])
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width*0.9, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
   
      }
}
