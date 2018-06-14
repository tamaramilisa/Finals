//
//  QuestionViewModel.swift
//  Finals
//
//  Created by tamara on 14/06/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class QuestionViewModel: BaseViewModel {
    
    var navigationService: NavigationService!
    var networking: AlamofireNetworking!
    var realmManager = RealmManager()
    
    required init() {}
    
    
}
