//
//  ApiRequestWrapper.swift
//  Yalla-Sport
//
//  Created by Mahmoud Elattar on 4/20/21.
//  Copyright © 2021 ITI. All rights reserved.
//
import Foundation
import Alamofire

enum Endpoint{
    case staticEndpoint
    case dynamicEndPoint(path : String)
}

enum HttpMethod : String{
    case get    = "GET"
    case post   = "POST"
    case delete = "DELETE"
    
}

enum Task {
    case requestPlain
    case requestParameters(parameters :[String:String] , encoding : ParameterEncoding)
}

protocol ApiRequestWrapper {
    var baseURL  : String           {get}
    var endpoint : String           {get}
    var method   : HttpMethod       {get}
    var task     : Task             {get}
    var headers  : [String:String]? {get}
    
}
