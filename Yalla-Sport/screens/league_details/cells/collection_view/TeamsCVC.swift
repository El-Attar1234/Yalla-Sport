//
//  TeamsCVC.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/24/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit

class TeamsCVC: UICollectionViewCell {
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    
    func set(for team  :Team) {
       // downloadTeamDetailsByName(teamName: team.strTeamBadge!, image: teamImage)
        teamImage.doenloadImage(url: team.strTeamBadge!)
        teamName.text =  team.strTeam
            
     
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

