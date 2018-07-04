//
//  MainViewModel.swift
//  Finals
//
//  Created by tamara on 01/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class MainViewModel: BaseViewModel, NetworkRequestHandler {
    
    var navigationService: NavigationService!
    var networking: AlamofireNetworking!
    var realmManager = RealmManager()
    
    let bag = DisposeBag()
    
    required init() {}
    
//    func createUser(firstName: String, lastName: String, email: String, password: String) -> Observable<Result<RMUser?>> {
//
//        return networking.createUser(firstName: firstName, lastName: lastName, email: email, password: password).map { (response, data) -> Result<RMUser?> in
//            let userData = UserLoginData(JSON: data as! Dictionary<String, AnyObject>)
//
//            if let err = self.extractError(response: response, data: userData) {
//                return .failure(err)
//            } else {
//                return .success(userData?.user)
//            }
//        }
//    }
//
    func getUserByEmail(email: String) {

        networking.getUserByEmail(email: email).map{ [weak self] (response, data) -> Result<ObjectResponse<RMUser>> in
            guard let `self` = self else { return .failure(RequestError(message: "Error")) }
            
            return self.parseJSONAsTopLevelDictionary(data: data, response: response)
            
            }.subscribe(onNext: { [weak self] (result) in
                guard let `self` = self else { return }
                
                switch result {
                case .success(let data):
                    if let user = data.data {
                        self.saveMeToRealm(me: user)
                    }
                case .failure(let error):
                    dump(error)
                }
                }, onError: { (error) in
                    dump(error)
            }, onCompleted: nil, onDisposed: nil).disposed(by: bag)
    }
    
    func saveMeToRealm(me: RMUser) {
        DispatchQueue.global().async(execute: { [weak self] in
        guard let `self` = self else { return }
        
        self.realmManager.saveUser(user: me)
        })
    }
}
