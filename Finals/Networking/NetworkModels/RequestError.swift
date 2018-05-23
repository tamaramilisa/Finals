//
//  RequestError.swift
//  Finals
//
//  Created by Tamara Milisa on 10/04/18.
//  Copyright © 2018 Tamara Milisa. All rights reserved.
//

import Foundation
import ObjectMapper

class RequestError: Mappable, Error {
	var message: String?

    init(message: String) {
        self.message = message
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        message <- map["message"]
    }
}
