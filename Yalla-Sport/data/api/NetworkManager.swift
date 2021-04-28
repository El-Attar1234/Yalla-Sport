//
//  NetworkManager.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/20/21.
//  Copyright © 2021 ITI. All rights reserved.
//


import Foundation
import Alamofire
/*
protocol MovieApiProtocol<T:ApiRequestWrapper>{
    
}*/

class NetworkManager<T :ApiRequestWrapper>{
    
    func fetchData<M :Codable>(target:T,responseClass : M.Type, completion:@escaping (Result<M?, NSError>) -> Void){
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
         let params = buildParams(task: target.task)
    

    AF.request(target.baseURL+target.endpoint, method: method, parameters: params.0, encoding:params.1, headers: headers).responseJSON { (response) in
        guard let statusCode = response.response?.statusCode else {
         // ADD Custom Error
                               let error = NSError(domain: target.baseURL, code: 200, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.genericError])
                               completion(.failure(error))
                               return
        }
      //  print("\(response)")
        if statusCode == 200 { // 200 reflect success response
            // Successful request
            guard let jsonResponse = try? response.result.get() else {
             // ADD Custom Error
                                   let error = NSError(domain: target.baseURL, code: 200, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.genericError])
                                   completion(.failure(error))
                                   return
            }
            // print("jsonResponse---->\(jsonResponse)")
            guard let theJSONData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else {
                 // ADD Custom Error
                                        let error = NSError(domain: target.baseURL, code: 200, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.genericError])
                                        completion(.failure(error))
                                        return
            }
           // print("theJsonData---->\(theJSONData)")
            guard let responseObj = try? JSONDecoder().decode(M.self, from: theJSONData) else {
                // ADD Custom Error
                                   let error = NSError(domain: target.baseURL, code: 200, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.genericError])
                                   completion(.failure(error))
                                   return
            }
            //   print("responseObj---->\(responseObj)")
            completion(.success(responseObj))
        } else {
            // ADD custom error base on status code 404 / 401 /
            // Error Parsing for the error message from the BE
            let message = "Error Message Parsed From backend"
            let error = NSError(domain: target.baseURL, code: statusCode, userInfo: [NSLocalizedDescriptionKey: message])
            completion(.failure(error))
        }
    }
    }
    
    private func buildParams(task: Task) -> ([String:Any], ParameterEncoding) {
          switch task {
          case .requestPlain:
              return ([:], URLEncoding.default)
          case .requestParameters(parameters: let parameters, encoding: let encoding):
              return (parameters, encoding)
          }
      }
    
}
