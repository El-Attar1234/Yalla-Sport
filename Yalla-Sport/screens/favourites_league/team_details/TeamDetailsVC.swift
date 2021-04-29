//
//  TeamDetailsVC.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/24/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit


class TeamDetailsVC: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var leagueLabel: UILabel!
    @IBOutlet weak var stadiumName: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var descriptionTV: UITextView!
    @IBOutlet weak var facebookLogo: UIImageView!
    @IBOutlet weak var twitterLogo: UIImageView!
    @IBOutlet weak var instgramLogo: UIImageView!
    
    @IBOutlet weak var webSiteLogo: UIImageView!
    
    var faceBookURL:String!
    var instgramURL:String!
    var twitterURL:String!
    var websiteURL:String!
    
    
    var targetTeam : String!
    
    var teamData : Team!
    let viewModel = TeamViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      downloadTeamData()
       
    }
    override func viewWillAppear(_ animated: Bool) {
            navigationController?.setNavigationBarHidden(false, animated: true)
                    self.tabBarController?.tabBar.isHidden = true
       }
    
    
   
    private func downloadTeamData(){
        viewModel.checkIfDataIsLoading = { isLoading in
            if isLoading {self.showLoadingIndicator()}
            else{
                self.hideLoadingIndicator()}
        }
        viewModel.checkIfResponseIsSuccess = { isSuccess in
            if isSuccess {
                //       updateTableView
                self.teamData = self.viewModel.teamData
                
                DispatchQueue.main.async {
                    self.inflateData(team: self.teamData)
                }
            }
            else{
                //internet error
                
              //  self.addConnectionlessImage()
            }
        }
        
        viewModel.downloadTeamDetailsByName(teamName: targetTeam)
    }
  
    private func inflateData(team:Team){
        backgroundImage.doenloadImage(url: team.strStadiumThumb!)
        teamImage.doenloadImage(url: team.strTeamBadge!)
        teamName.text      = team.strTeam
        leagueLabel.text   = team.strLeague
        stadiumName.text   = team.strStadium
        countryName.text   = team.strCountry
        descriptionTV.text = team.strDescriptionEN
        faceBookURL        = team.strFacebook
        addTapsToFaceBook(image: facebookLogo)
        
        twitterURL        = team.strTwitter
         addTapsToTwitter(image: twitterLogo)
        
        instgramURL        = team.strInstagram
          addTapsToInstgram(image: instgramLogo)
        websiteURL        = team.strWebsite
          addTapsToWebsite(image: webSiteLogo)
        
    }
   
}
