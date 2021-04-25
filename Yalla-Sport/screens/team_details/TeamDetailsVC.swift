//
//  TeamDetailsVC.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/24/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import UIKit
import SafariServices

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //   addTapsToImages()
        downloadTeamDetailsByName()
    }
    
    
    private func downloadTeamDetailsByName(){
        let remoteDatasource = RemoteDataSource()
        //   self.view.showIndicator()
        remoteDatasource.getTeamDetailsByName(teamName :"Arsenal"){[weak self] (result) in
            // guard let self = self else{return}
            //     self.view.hideIndicator()
            switch result {
            case .success(let response):
                guard let teams = response?.teams else { return  }
                DispatchQueue.main.async {
                    self?.inflateData(team: teams[0])                     }
                
                
                
            case .failure(let error):
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                print(error.code)
            }
        }
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
    
    private func addTapsToFaceBook(image :UIImageView){
        var tapGR = UITapGestureRecognizer(target: self, action: #selector(self.faceBookTaped))
          image.addGestureRecognizer(tapGR)
           image.isUserInteractionEnabled = true
    }
    @objc func faceBookTaped(_ sender: UITapGestureRecognizer ) {
            print("UIImageView tapped")
        guard let url=URL(string: "https://\(faceBookURL!)")else {
            print("error")
            return}
          let safariVC=SFSafariViewController(url: url)
         present(safariVC, animated: true)
    }
    
  private func addTapsToTwitter(image :UIImageView){
        var tapGR = UITapGestureRecognizer(target: self, action: #selector(self.twitterTapedTaped))
          image.addGestureRecognizer(tapGR)
           image.isUserInteractionEnabled = true
    }
    @objc func twitterTapedTaped(_ sender: UITapGestureRecognizer ) {
            print("UIImageView tapped")
        guard let url=URL(string: "https://\(twitterURL!)")else {
            print("error")
            return}
          let safariVC=SFSafariViewController(url: url)
         present(safariVC, animated: true)
    }
    
    private func addTapsToInstgram(image :UIImageView){
           var tapGR = UITapGestureRecognizer(target: self, action: #selector(self.instgramTapedTaped))
             image.addGestureRecognizer(tapGR)
              image.isUserInteractionEnabled = true
       }
       @objc func instgramTapedTaped(_ sender: UITapGestureRecognizer ) {
               print("UIImageView tapped")
           guard let url=URL(string: "https://\(instgramURL!)")else {
               print("error")
               return}
             let safariVC=SFSafariViewController(url: url)
            present(safariVC, animated: true)
       }
    
    private func addTapsToWebsite(image :UIImageView){
              var tapGR = UITapGestureRecognizer(target: self, action: #selector(self.websiteTapedTaped))
                image.addGestureRecognizer(tapGR)
                 image.isUserInteractionEnabled = true
          }
          @objc func websiteTapedTaped(_ sender: UITapGestureRecognizer ) {
                  print("UIImageView tapped")
              guard let url=URL(string: "https://\(websiteURL!)")else {
                  print("error")
                  return}
                let safariVC=SFSafariViewController(url: url)
               present(safariVC, animated: true)
          }
}
