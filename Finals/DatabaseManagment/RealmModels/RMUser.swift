//
//  RMUser.swift
//  Finals
//
//  Created by tamara on 04/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm


class RMUser: Object, Mappable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String?
    @objc dynamic var lastName: String?
    @objc dynamic var points: Int = 0
    @objc dynamic var email: String?
    
//    var profileImageUrl: URL? {
//        if let image = profileImage {
//            return URL(string: image)
//        }
//        return nil
//    }
    
    override static func primaryKey() -> String {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    convenience init(id: Int, firstName: String, lastName: String, points: Int) {
        self.init()
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.points = points
    }
    
    func mapping(map: Map) {
        id <- (map["id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        firstName <- map["first_name"]
        lastName <- map ["last_name"]
        email <- map["email"]
    }
    
}
