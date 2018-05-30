//
//  ProfileViewModel.swift
//  Finals
//
//  Created by tamara on 30/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class ProfileViewModel: BaseViewModel {
    
    var navigationService: NavigationService!
    var networking: AlamofireNetworking!
    var realmManager = RealmManager()
    
    required init() {}
    
}
