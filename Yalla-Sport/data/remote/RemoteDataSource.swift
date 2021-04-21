//
//  RemoteDataSource.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/20/21.
//  Copyright © 2021 ITI. All rights reserved.
//

import Foundation
protocol RemoteDataSourceProtocol {
    func getAllSports(completion: @escaping (Result<SportsResponse<Sport>?, NSError>) -> Void)
}


class RemoteDataSource: NetworkManager<RemoteDataSourceWrapper> , RemoteDataSourceProtocol {
    func getAllSports(completion:  @escaping (Result<SportsResponse<Sport>?, NSError>) -> Void) {
        self.fetchData(target: .getAllSports, responseClass:SportsResponse<Sport>.self) { (result) in
                  completion(result)
              }
    }
    
   
}
