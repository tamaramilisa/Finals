//
//  RMQuestion.swift
//  Finals
//
//  Created by tamara on 04/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper
import ObjectMapper_Realm

class RMQuestion: Object, Mappable {

    @objc dynamic var id: Int = 0
    @objc dynamic var text: String?
    @objc dynamic var photoName: String?
    @objc dynamic var answerId: Int = 0
    @objc dynamic var answer1: String?
    @objc dynamic var answer2: String?
    @objc dynamic var answer3: String?
    @objc dynamic var answer4: String?
    @objc dynamic var correct: Int = 0
    
    override static func primaryKey() -> String {
        return "id"
    }

    required convenience init?(map: Map) {
        self.init()
    }
    
    convenience init(id: Int, text: String, answer1: String, answer2: String, answer3: String, answer4: String, correct: Int) {
        self.init()
        self.id = id
        self.text = text
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
        self.answer4 = answer4
        self.correct = correct
    }

    func mapping(map: Map) {
        id <- (map["id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        text <- map["text"]
    }

}

