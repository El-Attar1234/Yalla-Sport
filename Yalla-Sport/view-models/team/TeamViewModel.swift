//
//  TeamViewModel.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/28/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation

class TeamViewModel : NSObject{
    
    var remoteDataSource : RemoteDataSourceProtocol!
   var teamData : Team!
    
    var isLoading : Bool!{
        didSet{
            self.checkIfDataIsLoading(isLoading)
        }
    }
    var isSuccess : Bool!{
        didSet{
            self.checkIfResponseIsSuccess(isSuccess)
        }
    }
    
    
    var checkIfDataIsLoading : (Bool)->() = { _ in }
    var checkIfResponseIsSuccess : (Bool)->() = { _ in }
    
  
    override init() {
        super.init()
        remoteDataSource = RemoteDataSource()
    }
    
    
     func downloadTeamDetailsByName(teamName :String){
        
            self.isLoading = true
        self.remoteDataSource.getTeamDetailsByName(teamName :teamName){[weak self] (result) in
               guard let self = self else{return}
               //     self.view.hideIndicator()
               switch result {
               case .success(let response):
                   guard let teams = response?.teams else { return  }
                   self.isLoading = false
                   self.teamData = teams[0]
                 self.isSuccess = true
               case .failure(let _):
                 self.isSuccess = false
                  /* print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                   print(error.code)*/
               }
           }
       }
    
    
    
    
    
}
