//
//  UserLoginData.swift
//  Finals
//
//  Created by Tamara Milisa on 06/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import ObjectMapper

class UserLoginData: Mappable, ModelType {
    
    var status: Bool?
    var user: RMUser?
    var token: String?
//    var registered: Bool?
    var errors: Array<RequestError>?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        user <- map["data.user"]
        token <- map["data.auth_token"]
        status <- map["success"]
//        registered <- map["data.now_registered"]
        errors <- map["error"]
    }
    
}
