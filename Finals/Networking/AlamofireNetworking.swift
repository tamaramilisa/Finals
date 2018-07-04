//
//  AlamofireNetworking.swift
//  Finals
//
//  Created by Tamara Milisa on 10/04/18.
//  Copyright © 2018 Tamara Milisa. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

struct AlamofireNetworking {

	func request(router : AlamofireRouter) -> Observable<(HTTPURLResponse, Any)> {
		return RxAlamofire.requestJSON(router.method, router.url, parameters: router.params, encoding: router.encoding, headers: router.headers).observeOn(MainScheduler.instance)
	}
    
    func createUser(firstName: String, lastName: String, email:String, password: String) -> Observable<(HTTPURLResponse, Any)> {

        let params: [String: Any]? = [
            "first_name" : firstName,
            "last_name" : lastName,
            "email" : email,
            "password" : password,
            "confirm_password" : password
        ]

        return request(router: FinalsRouter.PostNoAuth(path: "/signup", params: params as [String : AnyObject]?)).debug()
    }
    
    func login(username: String, password: String) -> Observable<(HTTPURLResponse, Any)> {
        
        return request(router: FinalsRouter.UserLogin(path: "/auth/login", username: username, password: password)).debug()
    }
    
    func getUserByEmail(email: String) -> Observable<(HTTPURLResponse, Any)> {
        
        let params: [String: Any]? = [
            "email" : email
        ]
        
        return request(router: FinalsRouter.Get(path: "/users/get-by-email", params: params as [String : AnyObject]?)).debug()
        
    }
}
