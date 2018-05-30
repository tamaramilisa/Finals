//
//  SettingsPresenter.swift
//  Finals
//
//  Created by tamara on 30/05/2018.
//  Copyright © 2018 tamara. All rights reserved.
//

import Foundation

class SettingsPresenter: BasePresenter {
    
    required init() { }
    
    weak var baseViewController: BaseViewController!
    weak var viewController: SettingsViewController! {
        return baseViewController as! SettingsViewController
    }
    
    func setUp() {
        
    }
}
