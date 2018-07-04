//
//  RMLevel.swift
//  Finals
//
//  Created by tamara on 04/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm


class RMLevel: Object, Mappable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String?
    @objc dynamic var isLocked: Bool = false
    //    @objc dynamic var email: String?
    
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    convenience init(id: Int, name: String, isLocked: Bool) {
        self.init()
        self.id = id
        self.name = name
        self.isLocked = isLocked
    }
    
    func mapping(map: Map) {
        id <- (map["id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        name <- map["name"]
        isLocked <- map["isLocked"]
        //        email <- map["email"]
    }
    
}
