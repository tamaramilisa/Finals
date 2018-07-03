//
//  FinalsRouter.swift
//  Finals
//
//  Created by tamara on 06/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import Alamofire

protocol AlamofireRouter {
    var method: HTTPMethod { get }
    var params: [String: AnyObject]? { get }
    var url: URL { get }
    var encoding: ParameterEncoding { get }
    var headers: [String : String]? { get }
}


enum FinalsRouter: URLRequestConvertible, AlamofireRouter {
    
    static var baseURLString: String {
        return "http://169.254.193.92:3000"
    }
    
    case Get(path: String, params: [String: AnyObject]?)
    case PostNoAuth(path: String, params: [String: AnyObject]?)
    case UserLogin(path: String, username: String, password: String)
    case Put(path: String, params: [String: AnyObject]?)
    case Post(path: String, params: [String: AnyObject]?)
    case Delete(path: String, params: [String: AnyObject]?)
    
    var method: HTTPMethod {
        switch self {
        case .Get(_, _):
            return HTTPMethod.get
        case .PostNoAuth(_, _), .UserLogin(_):
            return HTTPMethod.post
        case .Put(_, _):
            return HTTPMethod.put
        case .Post(_, _):
            return HTTPMethod.post
        case .Delete(_, _):
            return HTTPMethod.delete
        }
    }
    
    var params: [String: AnyObject]? {
        switch self {
        case .Get(_, let params):
            return params
        case .PostNoAuth(_, let params):
            return params
        case .UserLogin(_):
            return nil
        case .Put(_, let params):
            return params
        case .Post(_, params: let params):
            return params
        case .Delete(_,let params):
            return params
        }
    }
    
    var url: URL {
        switch self {
        case .Get(let path, _), .PostNoAuth(let path, _), .UserLogin(let path, _, _), .Put(let path, _), .Post(let path, _), .Delete(let path, _):
            return URL(string: FinalsRouter.baseURLString + path)!
        }
    }

    var headers: [String : String]? {
        let authToken = UserStorage.shared.accessToken ?? ""

        switch self {
        case .PostNoAuth(_, _):
            return nil
        case .UserLogin(_):
            return nil
        default:
            let uncodedString = authToken + ":"
            let encodedString = uncodedString.data(using: String.Encoding.utf8)!.base64EncodedString()
            return ["Authorization" : "Basic " + encodedString]
        }
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: params)
    }
    
}
