//
//  RealmManager.swift
//  Finals
//
//  Created by tamara on 21/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

struct RealmManager {
    
    let realm: Realm
    var myTimestamp: Int {
        return Int(Date().timeIntervalSince1970)
    }
    let bag = DisposeBag()
    
    init() {
        realm = try! Realm()
    }
    
//    func getClubWithId(id: Int) -> RMClub? {
//        let thisRealm = try! Realm()
//        let deletedPredicate = NSPredicate(format: "deleted == 0")
//        let idPredicate = NSPredicate(format: "id == %d", id)
//        let clubs = thisRealm.objects(RMClub.self).filter(deletedPredicate).filter(idPredicate)
//        return clubs.first
//    }
    
//    func saveClubs(clubs: [RMClub]) {
//        let theRealm = try! Realm()
//        try! theRealm.write {
//            theRealm.add(clubs, update: true)
//        }
//    }
    
//    func getEvents() -> Results<RMEvent> {
//        let theRealm = try! Realm()
//        let deletedPredicate = NSPredicate(format: "deleted == 0")
//        let events = theRealm.objects(RMEvent.self).filter(deletedPredicate)
//        return events
//    }
    
//    func getUsers() -> Results<RMUser> {
//        let thisRealm = try! Realm()
//        let deletedPredicate = NSPredicate(format: "deleted == 0")
//        let users = thisRealm.objects(RMUser.self).filter(deletedPredicate)
//        return users
//    }
//
//    func getMe() -> Results<RMUser> {
//        let theRealm = try! Realm()
//        let predicate = NSPredicate(format: "id == %d", UserStorage.shared.userId)
//        let deletedPredicate = NSPredicate(format: "deleted == 0")
//        return theRealm.objects(RMUser.self).filter(deletedPredicate).filter(predicate)
//    }
//
//    func getUser() -> RMUser? {
//        return getMe().first
//    }


    func saveUser(user: RMUser) {
        let theRealm = try! Realm()
        try! theRealm.write {
            theRealm.add(user, update: true)
        }
    }
    
    func getUserByEmail(email: String) -> Results<RMUser> {
        let theRealm = try! Realm()
        let predicate = NSPredicate(format: "email == %s", email)
        return theRealm.objects(RMUser.self).filter(predicate)
    }
    
    func saveQuestion(question: RMQuestion) {
        let theRealm = try! Realm()
        try! theRealm.write {
            theRealm.add(question, update: true)
        }
    }
    
    func getQuestionById(id: Int) -> Results<RMQuestion> {
        let theRealm = try! Realm()
        let predicate = NSPredicate(format: "id==%d", id)
        return theRealm.objects(RMQuestion.self).filter(predicate)
    }
    
    func softDelete() {
        realm.beginWrite()
//        realm.objects(RMPrize.self).setValue(1, forKey: "deleted")
//       realm.objects(RMActivation.self).setValue(1, forKey: "deleted")
        try! realm.commitWrite()
    }
    
    func hardDelete() {
        let deletedPredicate = NSPredicate(format: "deleted == 1")
        try! self.realm.write({
//            self.realm.delete(self.realm.objects(RMClub.self).filter(deletedPredicate))
//           self.realm.delete(self.realm.objects(RMActivation.self).filter(deletedPredicate))
        })
    }
}
