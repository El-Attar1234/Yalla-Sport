//
//  SportsViewModel.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/26/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation


class SportsViewModel :NSObject{
    var remoteDataSource : RemoteDataSourceProtocol!
     var connectivityManager  : ConnectivityManager!
      var sports = [Sport]()
    
    var isOnline : Bool!{
          didSet{
              self.checkIfUserisOnline(isOnline)
            self.checKConnection(isOnline)
          }
      }
    
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
    var checkIfUserisOnline : (Bool)->() = { _ in }
     var checKConnection : (Bool)->() = { _ in }
     var checkIfResponseIsSuccess : (Bool)->() = { _ in }
    
    
    
    
    override init() {
        super.init()
        remoteDataSource  = RemoteDataSource()
        connectivityManager = ConnectivityManager.shared
        
    }
    
    func checkConnection(){
        isOnline = connectivityManager.isOnline()
    }
    func downloadSports(){
            isLoading = true
         remoteDataSource.getAllSports {[weak self] (result) in
             guard let self = self else{return}
            self.isLoading = false
             switch result {
             case .success(let response):
                 guard let sports = response?.sports else { return  }
                 self.sports=sports
                  self.isSuccess = true
  
             case .failure(let _):
                self.isSuccess = false
                /* print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "")
                 print(error.code)*/
             }
         }
     }
    
    
    
    
    
    
}
