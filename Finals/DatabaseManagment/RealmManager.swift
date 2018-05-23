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
