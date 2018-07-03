//
//  LoginViewModel.swift
//  Finals
//
//  Created by tamara on 01/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

class LoginViewModel: BaseViewModel, NetworkRequestHandler {
    
    var navigationService: NavigationService!
    var networking: AlamofireNetworking!
    var realmManager = RealmManager()
    
    required init() {}
    
    func createUser(firstName: String, lastName: String, email: String, password: String) -> Observable<Result<RMUser?>> {
        
        return networking.createUser(firstName: firstName, lastName: lastName, email: email, password: password).map { (response, data) -> Result<RMUser?> in
            let userData = UserLoginData(JSON: data as! Dictionary<String, AnyObject>)
            
            if let err = self.extractError(response: response, data: userData) {
                return .failure(err)
            } else {
                return .success(userData?.user)
            }
        }
    }
    
    func login(username: String, password: String) -> Observable<Result<(RMUser?, String?)>> {
        return networking.login(username: username, password: password).map{ (response, data) -> Result<(RMUser?, String?)> in
            let userData = UserLoginData(JSON: data as! Dictionary<String, AnyObject>)
            
            if let err = self.extractError(response: response, data: userData) {
                return .failure(err)
            } else {
                let tuple: (RMUser?, String?) = (userData?.user, userData?.token)
                return .success(tuple)
            }
        }
    }
    
}
