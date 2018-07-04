//
//  RMCategory.swift
//  Finals
//
//  Created by tamara on 04/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm


class RMCategory: Object, Mappable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String?
    @objc dynamic var desc: String?
//    @objc dynamic var email: String?
    
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    convenience init(id: Int, name: String, desc: String) {
        self.init()
        self.id = id
        self.name = name
        self.desc = desc
    }
    
    func mapping(map: Map) {
        id <- (map["id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        name <- map["name"]
        desc <- map["description"]
//        email <- map["email"]
    }
    
}
