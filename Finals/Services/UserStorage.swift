//
//  UserStorage.swift
//  Finals
//
//  Created by Tamara Milisa on 06/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class UserStorage {
    
    static var shared = UserStorage()
    
    private var storageAccessToken: String?
    private let accessTokenKey = "access_token"
    var accessToken: String? {
        get {
            storageAccessToken = storageAccessToken ?? UserDefaults.standard.string(forKey: accessTokenKey)
            return storageAccessToken
        }
        set {
            storageAccessToken = newValue
            if newValue != nil {
                UserDefaults.standard.setValue(newValue, forKey: accessTokenKey)
            } else {
                UserDefaults.standard.removeObject(forKey: accessTokenKey)
            }
            UserDefaults.standard.synchronize()
        }
    }
    
    private var storageId: Int = 0
    private let userIdKey = "user_id"
    var userId: Int {
        get {
            storageId = UserDefaults.standard.integer(forKey: userIdKey)
            return storageId
        }
        set {
            storageId = newValue
            UserDefaults.standard.set(newValue, forKey: userIdKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    private var storageUserEmail: String?
    private let userEmailKey = "user_email"
    var userEmail: String? {
        get {
            storageUserEmail = storageUserEmail ?? UserDefaults.standard.string(forKey: userEmailKey)
            return storageUserEmail
        }
        set {
            storageUserEmail = newValue
            if newValue != nil {
                UserDefaults.standard.setValue(newValue, forKey: userEmailKey)
            } else {
                UserDefaults.standard.removeObject(forKey: userEmailKey)
            }
            UserDefaults.standard.synchronize()
        }
    }
    
}
