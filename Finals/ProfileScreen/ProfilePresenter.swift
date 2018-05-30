//
//  ProfilePresenter.swift
//  Finals
//
//  Created by tamara on 30/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class ProfilePresenter: BasePresenter {
    
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: ProfileViewController! {
        return baseViewController as! ProfileViewController
    }
    
    func setUp() {
        
    }
}
