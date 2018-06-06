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
    var headers: [String: String]? { get }
}


enum FinalsRouter: URLRequestConvertible, AlamofireRouter {
    
    static var baseURLString: String {
        return "https://api.likeus.hr/v2"
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
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var headers: [String: String]? {
        switch self {
        case .PostNoAuth(_, _):
            return ["Accept-Language" : "language"]
        case .UserLogin(_, let username, let password):
            let uncodedString = username + ":" + password
            let encodedString = uncodedString.data(using: String.Encoding.utf8)!.base64EncodedString()
            return ["Authorization" : "Basic " + encodedString, "Accept-Language" : "language"]
        default:
//            guard let token = "UserStorage.shared.accessToken" else { return nil }
            let uncodedString = "token" + ":"
            if let encodedString = uncodedString.data(using: String.Encoding.utf8)?.base64EncodedString() {
                return ["Authorization" : "Basic " + encodedString, "Accept-Language" : "language"]
            } else {
                return nil
            }
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: params)
    }
    
}
