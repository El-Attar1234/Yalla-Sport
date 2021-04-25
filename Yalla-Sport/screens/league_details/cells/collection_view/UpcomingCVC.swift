//
//  UpcomingCVC.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/24/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class UpcomingCVC: UICollectionViewCell {
    @IBOutlet weak var homeTeamImage: UIImageView!
    @IBOutlet weak var awayTeamImage: UIImageView!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var awayTeamName: UILabel!
    
    @IBOutlet weak var timeDateLabe: UILabel!
    
    func set(for event :Event) {
  downloadTeamDetailsByName(teamName: event.strHomeTeam!, image: homeTeamImage)
     downloadTeamDetailsByName(teamName: event.strAwayTeam!, image: awayTeamImage)
           homeTeamName.text =  event.strHomeTeam
           awayTeamName.text =  event.strAwayTeam
   
       }
    
     private func downloadTeamDetailsByName(teamName :String ,image :UIImageView){
              let remoteDatasource = RemoteDataSource()
              //   self.view.showIndicator()
              remoteDatasource.getTeamDetailsByName(teamName :teamName){[weak self] (result) in
                 // guard let self = self else{return}
                  //     self.view.hideIndicator()
                  switch result {
                  case .success(let response):
                      guard let teams = response?.teams else { return  }
                      DispatchQueue.main.async {
                         image.doenloadImage(url: teams[0].strTeamBadge ?? "no badg")
                      }
                      
                      
                      
                  case .failure(let error):
                      print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                      print(error.code)
                  }
              }
          }
    
}


