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
            UserDefaults.standard.setValue(newValue, forKey: userEmailKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    private var storageUserName: String?
    private let userNameKey = "user_name"
    var userName: String? {
        get {
            storageUserName = storageUserName ?? UserDefaults.standard.string(forKey: userNameKey)
            return storageUserName
        }
        set {
            storageUserName = newValue
            UserDefaults.standard.setValue(newValue, forKey: userNameKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    private var storageUserLastName: String?
    private let userLastNameKey = "user_lastname"
    var userLastName: String? {
        get {
            storageUserLastName = storageUserLastName ?? UserDefaults.standard.string(forKey: userLastNameKey)
            return storageUserLastName
        }
        set {
            storageUserLastName = newValue
            UserDefaults.standard.setValue(newValue, forKey: userLastNameKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    private var storageQuestions: Int = 0
    private let userQuestionsKey = "user_questions"
    var userQuestions: Int {
        get {
            storageQuestions = UserDefaults.standard.integer(forKey: userQuestionsKey)
            return storageQuestions
        }
        set {
            storageQuestions = newValue
            UserDefaults.standard.setValue(newValue, forKey: userQuestionsKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    private var storageCategories: Int = 0
    private let userCategoriesKey = "user_categories"
    var userCategories: Int {
        get {
            storageCategories = UserDefaults.standard.integer(forKey: userCategoriesKey)
            return storageCategories
        }
        set {
            storageCategories = newValue
            UserDefaults.standard.setValue(newValue, forKey: userCategoriesKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    private var storageMedals: Int = 0
    private let userMedalsKey = "user_medals"
    var userMedals: Int {
        get {
            storageMedals = UserDefaults.standard.integer(forKey: userMedalsKey)
            return storageMedals
        }
        set {
            storageMedals = newValue
            UserDefaults.standard.setValue(newValue, forKey: userMedalsKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    private var storageQuestionId: Int = 0
    private let questionIdKey = "question_id"
    var questionId: Int {
        get {
            storageQuestionId = UserDefaults.standard.integer(forKey: questionIdKey)
            return storageQuestionId
        }
        set {
            storageQuestionId = newValue
            UserDefaults.standard.setValue(newValue, forKey: questionIdKey)
            UserDefaults.standard.synchronize()
        }
    }
    
}
