//
//  ObjectResponse.swift
//  Finals
//
//  Created by Tamara Milisa on 04/07/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import ObjectMapper
import ObjectMapper_Realm
import RealmSwift

class ObjectResponse<T>: Mappable, ModelType where T:Object, T:Mappable {
    
    var data: T?
    var success: Bool?
    var errors: Array<RequestError>?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        errors <- map ["error"]
        data <- map["data"]
    }
}
