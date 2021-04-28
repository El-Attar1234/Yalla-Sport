//
//  ConnectivityManager.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/26/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation
import Reachability

class ConnectivityManager{
    static let shared = ConnectivityManager()
    let reachability =  try! Reachability()
    private init() {
        
    }
    
    func isOnline()->Bool{
        var isOnline:Bool!
        
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        
        
        if reachability.connection == .wifi {
            print("yes status")
            isOnline = true
        } else {
              print("No No")
            isOnline = false
        }
        reachability.whenUnreachable = { _ in
            print("No status")
            isOnline = false
        }
        
        return isOnline
        
    }
    
    
    
    
}
